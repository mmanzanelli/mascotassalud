import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mascotassalud/models/usuario_model.dart';

class AuthService {
  static const String _baseUrl = 'http://192.168.11.176:3000';

  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return response.statusCode == 200;
  }

  static Future<bool> register(
      String nombre, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body:
          jsonEncode({'nombre': nombre, 'email': email, 'password': password}),
    );
    return response.statusCode == 201;
  }
}
