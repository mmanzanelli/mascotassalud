import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _baseUrl = 'http://localhost:3000/api';

  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/usuarios/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'correo': email, 'contraseña': password}),
    );
    return response.statusCode == 200;
  }

  static Future<bool> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/usuarios/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'correo': email, 'contraseña': password}),
    );
    return response.statusCode == 200;
  }
}
