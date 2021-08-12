import 'dart:async';
import 'dart:convert';

import 'package:botybuy/providers/env.dart';
import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  // final _url = 'localhost:3002';
  final _host = API_URL;
  final prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final authdata = {
        'correo': email,
        'clave': password,
        'rolId': 4,
        'returnSecureToken': true
      };
      final headers = {"Content-Type": "application/json"};

      final response = await http.post(
        new Uri.http(_host, '/api/login'),
        headers: headers,
        body: json.encode(authdata),
      );

      Map<String, dynamic> decodedResp = await json.decode(response.body);

      //prefs.vistas = jsonEncode(decodedResp['vistas']);
      // print('Saved: '+prefs.vistas+ prefs.token);

      if (decodedResp.containsKey('token')) {
        prefs.token = decodedResp['token'];
        final vistas = {'vistas': decodedResp['vistas']};
        prefs.vistas = json.encode(vistas);
        return {
          'status': "OK",
          'token': decodedResp['token'],
          'vistas': decodedResp['vistas']
        };
      } else {
        return decodedResp;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> register(
      String nombre, String celular, String email, String password) async {
    try {
      final authdata = {
        'nombre': nombre,
        'celular': int.parse(celular),
        'email': email,
        'password': password,
        'rolId': 3,
        'returnSecureToken': true
      };
      final headers = {"Content-Type": "application/json"};

      final response = await http.post(
        new Uri.http(_host, '/api/register'),
        headers: headers,
        body: json.encode(authdata),
      );
      Map<String, dynamic> decodedResp = json.decode(response.body);
      // print(decodedResp);
      if (decodedResp.containsKey('token')) {
        return {
          'ok': true,
          'token': decodedResp['token'],
          'vistas': decodedResp['vistas']
        };
      } else {
        return {'ok': false};
      }
    } catch (e) {
      print(e);
    }
  }
}
