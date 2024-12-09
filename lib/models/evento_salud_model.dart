class EventoSalud {
  final int idEvento;
  final int idMascota;
  final DateTime fechaEvento;
  final String tipoEvento;
  final String? descripcion;
  final String? notas;
  final double? peso;
  final String? veterinario;
  final String? direccionVeterinario;

  EventoSalud({
    required this.idEvento,
    required this.idMascota,
    required this.fechaEvento,
    required this.tipoEvento,
    this.descripcion,
    this.notas,
    this.peso,
    this.veterinario,
    this.direccionVeterinario,
  });

  factory EventoSalud.fromJson(Map<String, dynamic> json) {
    return EventoSalud(
      idEvento: json['id_evento'],
      idMascota: json['id_mascota'],
      fechaEvento: DateTime.parse(json['fecha_evento']),
      tipoEvento: json['tipo_evento'],
      descripcion: json['descripcion'],
      notas: json['notas'],
      peso: json['peso'] != null ? (json['peso'] as num).toDouble() : null,
      veterinario: json['veterinario'],
      direccionVeterinario: json['direccion_veterinario'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_evento': idEvento,
      'id_mascota': idMascota,
      'fecha_evento': fechaEvento.toIso8601String(),
      'tipo_evento': tipoEvento,
      'descripcion': descripcion,
      'notas': notas,
      'peso': peso,
      'veterinario': veterinario,
      'direccion_veterinario': direccionVeterinario,
    };
  }
}
