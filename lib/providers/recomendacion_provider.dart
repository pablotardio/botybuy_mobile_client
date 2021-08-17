import 'dart:async';
import 'dart:convert';

import 'package:botybuy/models/CarritoModel.dart';
import 'package:botybuy/providers/env.dart';
import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';
import 'package:http/http.dart' as http;

class RecomendacionProvider {
  // final _url = 'localhost:3002';
  final _host = API_URL;
  final prefs = new PreferenciasUsuario();

  Future<List<dynamic>> listarRecomendaciones() async {
    try {
      final headers = getHeaders();
      final body={
        "numberOfItems":10
      };
      final response = await http.post(
        new Uri.http(_host, '/api/producto/recomendaciones'),
        headers: headers,
        body:json.encode(body)
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
      print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
}
}
