import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mascotassalud/providers/auth_provider.dart';
import 'package:mascotassalud/screens/home_screen.dart';
import 'package:mascotassalud/screens/login_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return auth.isAuthenticated ? HomeScreen() : LoginScreen();
        },
      ),
    );
  }
}
