import 'package:flutter/material.dart';
import 'package:mascotassalud/screens/auth/register_screen.dart';
import 'package:mascotassalud/screens/persistenBotton/PersistentBottomNavPage.dart';
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
      //routes: {
      // '/login': (context) => const LoginScreen(),
      // '/register': (context) => const RegisterScreen(),
      // '/home': (context) => HomeScreen(),
      // },
      //home: Consumer<AuthProvider>(
      //  builder: (context, auth, _) {
      //    return auth.isAuthenticated ? HomeScreen() : LoginScreen();
      //  },
      //), DESCOMENTAR EL BLOQUE PARA LA AUTENTICACION

      home: PersistentBottomNavPage(),
    );
  }
}
