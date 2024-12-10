import 'package:flutter/material.dart';

class EventsListScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {'date': '2023-12-10', 'event': 'Vacunación'},
    {'date': '2023-12-12', 'event': 'Cita Veterinaria'},
    {'date': '2023-12-15', 'event': 'Desparasitación'},
  ];

  EventsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos Próximos'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return ListTile(
            leading: const Icon(Icons.event),
            title: Text(event['event']!),
            subtitle: Text(event['date']!),
            onTap: () {
              // Acción al seleccionar un evento
            },
          );
        },
      ),
    );
  }
}
