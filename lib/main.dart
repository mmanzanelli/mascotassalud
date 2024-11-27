import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:mascotassalud/providers/auth_provider.dart';
import 'package:mascotassalud/screens/auth/login_screen.dart';
import 'package:mascotassalud/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MascotasApp(),
    ),
  );
}

class MascotasApp extends StatelessWidget {
  const MascotasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
      home: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return auth.isAuthenticated ? HomeScreen() : LoginScreen();
        },
      ),
    );
  }
}
