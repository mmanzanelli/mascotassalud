class TipoMascota {
  final int idTipoMascota;
  final String tipo;

  TipoMascota({
    required this.idTipoMascota,
    required this.tipo,
  });

  factory TipoMascota.fromJson(Map<String, dynamic> json) {
    return TipoMascota(
      idTipoMascota: json['id_tipo_mascota'],
      tipo: json['tipo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_tipo_mascota': idTipoMascota,
      'tipo': tipo,
    };
  }
}
