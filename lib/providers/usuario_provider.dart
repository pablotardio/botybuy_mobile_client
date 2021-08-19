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
      {String nombre,
      String celular,
      String email,
      String password,
      String fechaNac}) async {
    try {
      final authdata = {
        'nombre': nombre,
        'celular': celular,
        'correo': email,
        'clave': password,
        'fechaNac': fechaNac,
        'rolId': 4,
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
        prefs.token = decodedResp['token'];
        final vistas = {'vistas': decodedResp['vistas']};
        prefs.vistas = json.encode(vistas);
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

  Future<Map<String, dynamic>> create(
      {String nombre,
      String celular,
      String email,
      String password,
      String fechaNac,
      int rolId}) async {
    try {
      final body = {
        'nombre': nombre,
        'celular': celular,
        'correo': email,
        'clave': password,
        'fechaNac': fechaNac,
        'rolId': rolId,
        'returnSecureToken': true
      };
      final headers = {"Content-Type": "application/json"};

      final response = await http.post(
        new Uri.http(_host, '/api/usuario/crear'),
        headers: headers,
        body: json.encode(body),
      );
      Map<String, dynamic> decodedResp = json.decode(response.body);
      // print(decodedResp);
      if (decodedResp.containsKey('msg')) {
        return {
          'ok': true,
        };
      } else {
        return {'ok': false};
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> update(
      {int userToEditId,
      String nombre,
      String celular,
      String email,
      String password,
      String fechaNac,
      int rolId}) async {
    try {
      final body = {
        'nombre': nombre,
        'celular': celular,
        'correo': email,
        'clave': password,
        'fechaNac': fechaNac,
        'rolId': rolId,
        'returnSecureToken': true
      };
      final headers = {"Content-Type": "application/json"};

      final response = await http.put(
        new Uri.http(_host, '/api/usuario/editar/$userToEditId'),
        headers: headers,
        body: json.encode(body),
      );
      Map<String, dynamic> decodedResp = json.decode(response.body);
      // print(decodedResp);
      if (decodedResp.containsKey('msg')) {
        return {
          'ok': true,
        };
      } else {
        return {'ok': false};
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> listarUsuarios() async {
    try {
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/usuario/listar'),
        headers: headers,
      );

      Map<String, dynamic> decodedResp = await json.decode(response.body);
      print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> listarRoles() async {
    try {
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/rol/listar'),
        headers: headers,
      );

      Map<String, dynamic> decodedResp = await json.decode(response.body);
      print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
}
