class Usuario {
  final int idUsuario;
  final String nombre;
  final String email;
  final String password;
  final DateTime fechaRegistro;
  final String? fotoPerfil;
  final String idioma;
  final String tema;

  Usuario({
    required this.idUsuario,
    required this.nombre,
    required this.email,
    required this.password,
    required this.fechaRegistro,
    this.fotoPerfil,
    this.idioma = 'es',
    this.tema = 'claro',
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['id_usuario'],
      nombre: json['nombre'],
      email: json['email'],
      password: json['password'],
      fechaRegistro: DateTime.parse(json['fecha_registro']),
      fotoPerfil: json['foto_perfil'],
      idioma: json['idioma'] ?? 'es',
      tema: json['tema'] ?? 'claro',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_usuario': idUsuario,
      'nombre': nombre,
      'email': email,
      'password': password,
      'fecha_registro': fechaRegistro.toIso8601String(),
      'foto_perfil': fotoPerfil,
      'idioma': idioma,
      'tema': tema,
    };
  }
}
