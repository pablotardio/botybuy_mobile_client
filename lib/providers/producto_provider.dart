import 'dart:async';
import 'dart:convert';

import 'package:botybuy/models/CarritoModel.dart';
import 'package:botybuy/providers/env.dart';
import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';
import 'package:http/http.dart' as http;

class ProductoProvider {
  // final _url = 'localhost:3002';
  final _host = API_URL;
  final prefs = new PreferenciasUsuario();

  Future<List<dynamic>> listarProductos() async {
    try {
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/producto/listar'),
        headers: headers,
      );

      List<dynamic> decodedResp = await json.decode(response.body);
      print(decodedResp);
      return decodedResp;
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> getDetalleProducto(int id) async {
    try {
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/producto/ver/' + id.toString()),
        headers: headers,
      );

      Map<String, dynamic> decodedResp = await json.decode(response.body);
      print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> listarProductosPorCategoria(int categoriaId) async {
    try {
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/producto/listar/categoria/$categoriaId'),
        headers: headers,
      );

      List<dynamic> decodedResp = await json.decode(response.body);
      print(decodedResp);
      return decodedResp;
    } catch (e) {
      print(e);
    }
  }
}
