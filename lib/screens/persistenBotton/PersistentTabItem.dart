import 'package:flutter/material.dart';

class PersistentTabItem {
  final Widget tab; // Widget que representa la pestaña
  final GlobalKey<NavigatorState>?
      navigatorkey; // Llave para navegación independiente
  final String title; // Título que aparece en el BottomNavigationBar
  final IconData icon; // Ícono para la pestaña

  PersistentTabItem({
    required this.tab,
    this.navigatorkey,
    required this.title,
    required this.icon,
  });
}
