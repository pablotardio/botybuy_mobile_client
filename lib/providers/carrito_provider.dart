import 'dart:async';
import 'dart:convert';

import 'package:botybuy/models/CarritoModel.dart';
import 'package:botybuy/providers/env.dart';
import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';
import 'package:http/http.dart' as http;

class CarritoProvider {
  // final _url = 'localhost:3002';
  final _host = API_URL;
  final prefs = new PreferenciasUsuario();

  Future<List<dynamic>> getAllCarritos() async {
    try {
      final headers = getHeaders();
      final response = await http.get(
        new Uri.http(_host, '/api/carrito/ver'),
        headers: headers,
      );
      Map<String,dynamic> decodedResp = await json.decode(response.body);
      // print(decodedResp);
      return decodedResp['data']['productos'];
    } catch (e) {
      print(e);
    }
  }
  Future<List<dynamic>> confirmarCarrito() async {
    try {
      
      final headers = getHeaders();

      final response = await http.put(
        new Uri.http(_host, '/api/carrito/confirmar'),
        headers: headers,
      
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
       print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
    Future<List<dynamic>> addToCarrito(int productoId, int cantidad) async {
    try {
      
      final headers = getHeaders();
      final body={"productoId": productoId,"cantidad":cantidad};
      final response = await http.post(
        new Uri.http(_host, '/api/carrito/cliente/add/producto'),
        headers: headers,
        body: json.encode(body)
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
       print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
   Future<List<dynamic>> removeFromCarrito(int productoId, int ordenId) async {
    try {
      
      final headers = getHeaders();
      final body={"productoId": productoId,"ordenId":ordenId};
      final response = await http.post(
        new Uri.http(_host, '/api/carrito/cliente/remove/producto'),
        headers: headers,
        body: json.encode(body)
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
       print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
}
