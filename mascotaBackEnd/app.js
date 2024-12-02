// app.js
const express = require("express");
const pool = require("./db"); // Importa la conexión a la base de datos

const app = express();
const port = process.env.PORT || 3000;
// Importacion para seguridad de regsitro/usuariio
const bcrypt = require("bcrypt");
const cors = require("cors");

app.use(cors());

// Middleware para manejar JSON
app.use(express.json());

// Ruta de prueba para la raíz
app.get("/", (req, res) => {
  res.send("Bienvenido a la API de MascotaSalud");
});

// Ejemplo de endpoint de prueba para consultar la base de datos
app.get("/api/usuarios", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM usuarios");
    res.json(result.rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send("Error en el servidor");
  }
});

// Endpoint para registrar un nuevo usuario
app.post("/register", async (req, res) => {
  const { nombre, email, password } = req.body;

  try {
    // Verificar si el usuario ya existe
    const userExists = await pool.query(
      "SELECT * FROM usuarios WHERE email = $1",
      [email]
    );

    if (userExists.rows.length > 0) {
      return res.status(400).json({ error: "El usuario ya existe" });
    }

    // Hashear la contraseña
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);

    // Insertar el nuevo usuario en la base de datos
    const newUser = await pool.query(
      "INSERT INTO usuarios (nombre, email, password) VALUES ($1, $2, $3) RETURNING *",
      [nombre, email, hashedPassword]
    );

    res.status(201).json({
      message: "Usuario registrado exitosamente",
      user: newUser.rows[0],
    });
  } catch (error) {
    console.error(error.message);
    res.status(500).send("Error en el servidor");
  }
});

// Endpoint para iniciar sesión
app.post("/login", async (req, res) => {
  const { email, password } = req.body;

  try {
    // Buscar al usuario por email
    const user = await pool.query("SELECT * FROM usuarios WHERE email = $1", [
      email,
    ]);

    if (user.rows.length === 0) {
      return res.status(400).json({ error: "Credenciales inválidas" });
    }

    const userData = user.rows[0];

    // Comparar las contraseñas
    const validPassword = await bcrypt.compare(password, userData.password);

    if (!validPassword) {
      return res.status(400).json({ error: "Credenciales inválidas" });
    }

    // Si las credenciales son válidas, puedes generar un token (opcional)
    // Por ahora, simplemente retornamos un mensaje de éxito y los datos del usuario
    res
      .status(200)
      .json({ message: "Inicio de sesión exitoso", user: userData });
  } catch (error) {
    console.error(error.message);
    res.status(500).send("Error en el servidor");
  }
});

app.listen(port, "0.0.0.0", async () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);

  try {
    // Consulta de prueba para verificar la conexión
    await pool.query("SELECT NOW()");
    console.log("Conexión a la base de datos establecida correctamente.");
  } catch (error) {
    console.error("Error de conexión a la base de datos:", error.message);
  }
});
