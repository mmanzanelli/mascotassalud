import 'package:flutter/material.dart';
import 'package:mascotassalud/providers/events_provider.dart';
import 'package:provider/provider.dart';

class AddEventModal extends StatefulWidget {
  const AddEventModal({super.key});

  @override
  _AddEventModalState createState() => _AddEventModalState();
}

class _AddEventModalState extends State<AddEventModal> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String? _eventName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context)
          .viewInsets, // Asegura que no se sobreponga al teclado
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Añadir Evento',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nombre del Evento'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce un nombre';
                    }
                    return null;
                  },
                  onSaved: (value) => _eventName = value,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate != null
                            ? 'Fecha: ${_selectedDate!.toLocal()}'.split(' ')[0]
                            : 'Selecciona una fecha',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (_selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Por favor selecciona una fecha')),
                        );
                        return;
                      }
                      Provider.of<EventsProvider>(context, listen: false)
                          .addEvent(
                        _selectedDate!,
                        _eventName!,
                      );
                      Navigator.pop(context); // Cierra el modal
                    }
                  },
                  child: const Text('Guardar Evento'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
