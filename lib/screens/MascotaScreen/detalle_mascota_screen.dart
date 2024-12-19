import 'package:flutter/material.dart';
import 'package:mascotassalud/models/mascota_model.dart';

class DetalleMascotaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Mascota mascota =
        ModalRoute.of(context)!.settings.arguments as Mascota;

    return Scaffold(
      appBar: AppBar(
        title: Text(mascota.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${mascota.idMascota}'),
            Text('Nombre: ${mascota.nombre}'),
            Text('Tipo: ${mascota.idTipoMascota}'),
            Text('Color: ${mascota.color ?? 'No especificado'}'),
            Text('Esterilizado: ${mascota.esterilizado ? 'Sí' : 'No'}'),
            if (mascota.foto != null) Image.network(mascota.foto!),
          ],
        ),
      ),
    );
  }
}
