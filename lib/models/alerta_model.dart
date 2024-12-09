class Alerta {
  final int
      idAlerta; // ID único para identificar la alerta en la base de datos.
  final int idMascota; // ID de la mascota asociada con la alerta.
  final int? idEvento; // ID del evento de salud relacionado, si existe.
  final String titulo; // Título descriptivo de la alerta.
  final String? descripcion; // Descripción opcional de la alerta.
  final DateTime fechaAlerta; // Fecha y hora en que se debe activar la alerta.
  final String?
      recurrencia; // Frecuencia de repetición (diaria, semanal, etc.).
  final String? sonido; // Nombre o ruta del sonido asociado a la alerta.
  final bool activo; // Indica si la alerta está activa o desactivada.

  // Constructor del modelo
  Alerta({
    required this.idAlerta,
    required this.idMascota,
    this.idEvento,
    required this.titulo,
    this.descripcion,
    required this.fechaAlerta,
    this.recurrencia,
    this.sonido,
    this.activo = true,
  });

  // Constructor para crear un objeto a partir de JSON
  factory Alerta.fromJson(Map<String, dynamic> json) {
    return Alerta(
      idAlerta: json['id_alerta'],
      idMascota: json['id_mascota'],
      idEvento: json['id_evento'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      fechaAlerta: DateTime.parse(json['fecha_alerta']),
      recurrencia: json['recurrencia'],
      sonido: json['sonido'],
      activo: json['activo'] ?? true,
    );
  }

  // Método para convertir un objeto en JSON
  Map<String, dynamic> toJson() {
    return {
      'id_alerta': idAlerta,
      'id_mascota': idMascota,
      'id_evento': idEvento,
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha_alerta': fechaAlerta.toIso8601String(),
      'recurrencia': recurrencia,
      'sonido': sonido,
      'activo': activo,
    };
  }
}
