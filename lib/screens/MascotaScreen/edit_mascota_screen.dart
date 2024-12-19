import 'package:flutter/material.dart';
import 'package:mascotassalud/models/mascota_model.dart';

class EditMascotaScreen extends StatefulWidget {
  final Mascota mascota;

  const EditMascotaScreen({Key? key, required this.mascota}) : super(key: key);

  @override
  _EditMascotaScreenState createState() => _EditMascotaScreenState();
}

class _EditMascotaScreenState extends State<EditMascotaScreen> {
  late TextEditingController _nombreController;
  late TextEditingController _fotoController;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.mascota.nombre);
    _fotoController = TextEditingController(text: widget.mascota.foto);
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _fotoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Mascota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _fotoController,
              decoration: const InputDecoration(labelText: 'URL de la Foto'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes actualizar los datos de la mascota
                Navigator.pop(context);
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
