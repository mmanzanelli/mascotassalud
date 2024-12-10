import 'package:flutter/material.dart';
import '../calendarBotton/events_list_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarFormat _calendarFormat;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario'),
        actions: [
          // Botón para navegar a la lista cronológica
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Ver Todos los Eventos',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventsListScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) => _getEventsForDay(day),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue.shade300,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.red.shade300,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              markerDecoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              markersAlignment: Alignment.center,
              outsideDaysVisible: false,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _buildEventList(),
          ),
        ],
      ),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    if (day.day % 2 == 0) {
      return ['Vacunación', 'Cita Veterinaria'];
    } else {
      return [];
    }
  }

  Widget _buildEventList() {
    final events = _selectedDay != null ? _getEventsForDay(_selectedDay!) : [];
    if (events.isEmpty) {
      return const Center(child: Text('No hay eventos para este día.'));
    }
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(events[index]),
        );
      },
    );
  }
}
