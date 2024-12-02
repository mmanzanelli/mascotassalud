import 'package:flutter/material.dart';
import 'package:mascotassalud/screens/auth/register_screen.dart';
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
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
      home: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return auth.isAuthenticated ? HomeScreen() : LoginScreen();
        },
      ),
    );
  }
}
