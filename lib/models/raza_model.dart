class Raza {
  final int idRaza;
  final int idTipoMascota;
  final String raza;

  Raza({
    required this.idRaza,
    required this.idTipoMascota,
    required this.raza,
  });

  factory Raza.fromJson(Map<String, dynamic> json) {
    return Raza(
      idRaza: json['id_raza'],
      idTipoMascota: json['id_tipo_mascota'],
      raza: json['raza'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_raza': idRaza,
      'id_tipo_mascota': idTipoMascota,
      'raza': raza,
    };
  }
}
