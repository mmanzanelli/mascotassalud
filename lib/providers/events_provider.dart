import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  final Map<DateTime, List<String>> _events = {};

  Map<DateTime, List<String>> get events => _events;

  void addEvent(DateTime date, String eventName) {
    if (_events[date] != null) {
      _events[date]!.add(eventName);
    } else {
      _events[date] = [eventName];
    }
    notifyListeners(); // Notifica a los widgets dependientes
  }
}
