import 'dart:async';
import 'dart:convert';

import 'package:botybuy/models/CarritoModel.dart';
import 'package:botybuy/providers/env.dart';
import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';
import 'package:http/http.dart' as http;

class OrdenProvider {
  // final _url = 'localhost:3002';
  final _host = API_URL;
  final prefs = new PreferenciasUsuario();

  Future<List<dynamic>> getSolicitudes() async {
    try {
      
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/orden/solicitudes'),
        headers: headers,
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
      // print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
  Future<List<dynamic>> getDetalleOrden(int id) async {
    try {
      
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/orden/ver/'+id.toString()),
        headers: headers,
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
       print(decodedResp);
      return decodedResp['data']['productos'];
    } catch (e) {
      print(e);
    }
  }
  Future<List<dynamic>> changeEstado(int id,String estado) async {
    try {
      
      final headers = getHeaders();

      final response = await http.put(
        new Uri.http(_host, '/api/orden/actualizarEstado/'+id.toString()),
        headers: headers,
        body: json.encode({'estado':estado})
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
       print(decodedResp);
      return decodedResp['data'];
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
