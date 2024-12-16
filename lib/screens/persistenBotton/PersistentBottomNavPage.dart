import 'package:flutter/material.dart';

import 'package:mascotassalud/screens/persistenBotton/PersistentBottomBarScaffold.dart';
import 'package:mascotassalud/screens/persistenBotton/PersistentTabItem.dart';
import '../HomeScreen/home_screen.dart';
import '../calendarBotton/calendar_screen.dart';
import '../profile_screen.dart';

class PersistentBottomNavPage extends StatelessWidget {
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();

  PersistentBottomNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: const HomeScreen(), // Tab para la página Home
          icon: Icons.home,
          title: 'Home',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: const CalendarScreen(), // Tab para el Calendario
          icon: Icons.calendar_today,
          title: 'Calendar',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: const ProfileScreen(), // Tab para el Perfil
          icon: Icons.person,
          title: 'Profile',
          navigatorkey: _tab3navigatorKey,
        ),
      ],
    );
  }
}
