import 'dart:async';
import 'dart:convert';

import 'package:botybuy/models/CarritoModel.dart';
import 'package:botybuy/providers/env.dart';
import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';
import 'package:http/http.dart' as http;

class CategoriaProvider {
  // final _url = 'localhost:3002';
  final _host = API_URL;
  final prefs = new PreferenciasUsuario();

  Future<List<dynamic>> listarCategorias() async {
    try {
      
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/categoria/listar'),
        headers: headers,
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
       print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
  
}
