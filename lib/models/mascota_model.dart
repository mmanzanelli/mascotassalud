class Mascota {
  final int idMascota;
  final int idUsuario;
  final String nombre;
  final int idTipoMascota;
  final int? idRaza;
  final DateTime? fechaNacimiento;
  final String? sexo;
  final String? numeroIdentificacion;
  final String? color;
  final bool esterilizado;
  final String? foto;

  Mascota({
    required this.idMascota,
    required this.idUsuario,
    required this.nombre,
    required this.idTipoMascota,
    this.idRaza,
    this.fechaNacimiento,
    this.sexo,
    this.numeroIdentificacion,
    this.color,
    this.esterilizado = false,
    this.foto,
  });

  factory Mascota.fromJson(Map<String, dynamic> json) {
    return Mascota(
      idMascota: json['id_mascota'],
      idUsuario: json['id_usuario'],
      nombre: json['nombre'],
      idTipoMascota: json['id_tipo_mascota'],
      idRaza: json['id_raza'],
      fechaNacimiento: json['fecha_nacimiento'] != null
          ? DateTime.parse(json['fecha_nacimiento'])
          : null,
      sexo: json['sexo'],
      numeroIdentificacion: json['numero_identificacion'],
      color: json['color'],
      esterilizado: json['esterilizado'] ?? false,
      foto: json['foto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_mascota': idMascota,
      'id_usuario': idUsuario,
      'nombre': nombre,
      'id_tipo_mascota': idTipoMascota,
      'id_raza': idRaza,
      'fecha_nacimiento': fechaNacimiento?.toIso8601String(),
      'sexo': sexo,
      'numero_identificacion': numeroIdentificacion,
      'color': color,
      'esterilizado': esterilizado,
      'foto': foto,
    };
  }
}
