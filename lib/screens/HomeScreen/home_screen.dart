import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mascotassalud/models/mascota_model.dart';
import 'package:mascotassalud/providers/mascotas_provider.dart';
import 'package:mascotassalud/screens/HomeScreen/add_event_modal.dart';
import 'package:mascotassalud/screens/MascotaScreen/edit_mascota_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          // Menú desplegable para mostrar las mascotas
          Consumer<MascotasProvider>(
            builder: (context, mascotasProvider, _) {
              return PopupMenuButton<Mascota>(
                icon: const Icon(Icons.pets),
                tooltip: 'Mis Mascotas',
                onSelected: (Mascota mascota) {
                  Navigator.pushNamed(
                    context,
                    '/detalle_mascota',
                    arguments: mascota,
                  );
                },
                itemBuilder: (BuildContext context) {
                  final mascotas = mascotasProvider.mascotas;

                  if (mascotas.isEmpty) {
                    return [
                      const PopupMenuItem<Mascota>(
                        enabled: false,
                        child: Text('No tienes mascotas'),
                      ),
                    ];
                  }

                  return mascotas.map((mascota) {
                    return PopupMenuItem<Mascota>(
                      value: mascota,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: mascota.foto != null
                              ? NetworkImage(mascota.foto!)
                              : null,
                          child: mascota.foto == null
                              ? const Icon(Icons.pets)
                              : null,
                        ),
                        title: Text(mascota.nombre),
                        subtitle: const Text('Tap para detalles'),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: 'Editar Mascota',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditMascotaScreen(
                                  mascota: mascota,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList();
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Configuración',
            onPressed: () {
              Navigator.pushNamed(context, '/configuracion');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Próximo Evento',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ListTile(
                leading: Icon(Icons.vaccines, size: 40),
                title: Text('Vacunación'),
                subtitle: Text('Fecha: 10 de Noviembre, 10:00 AM'),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const AddEventModal(),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Añadir Evento',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
