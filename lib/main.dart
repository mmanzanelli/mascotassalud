import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mascotassalud/providers/mascotas_provider.dart';
import 'package:mascotassalud/providers/events_provider.dart';
import 'package:mascotassalud/screens/persistenBotton/PersistentBottomNavPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MascotasProvider()),
        ChangeNotifierProvider(create: (_) => EventsProvider()),
      ],
      child: const MascotasApp(),
    ),
  );
}

class MascotasApp extends StatelessWidget {
  const MascotasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Salud Animal",
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: PersistentBottomNavPage(),
    );
  }
}
