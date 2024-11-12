// app.js
const express = require("express");
const pool = require("./db"); // Importa la conexión a la base de datos

const app = express();
const port = process.env.PORT || 3000;

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

app.listen(port, async () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);

  try {
    // Consulta de prueba para verificar la conexión
    await pool.query("SELECT NOW()");
    console.log("Conexión a la base de datos establecida correctamente.");
  } catch (error) {
    console.error("Error de conexión a la base de datos:", error.message);
  }
});
