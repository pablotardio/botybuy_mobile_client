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
        new Uri.http(_host, '/api/orden/vendedor/solicitudes'),
        headers: headers,
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
      // print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
    Future<List<dynamic>> getPagosPendientes() async {
    try {
      
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/orden/cajero/solicitudes'),
        headers: headers,
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
      // print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
      Future<List<dynamic>> getEntregasPendientes() async {
    try {
      
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/orden/vendedor/entregas'),
        headers: headers,
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
      // print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
    Future<List<dynamic>> getMisSolicitudesCliente() async {
    try {
      
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/orden/cliente/solicitudes'),
        headers: headers,
      );

      Map<String,dynamic> decodedResp = await json.decode(response.body);
      // print(decodedResp);
      return decodedResp['data'];
    } catch (e) {
      print(e);
    }
  }
      Future<List<dynamic>> getMisComprasCliente() async {
    try {
      
      final headers = getHeaders();

      final response = await http.get(
        new Uri.http(_host, '/api/orden/cliente/comprados'),
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
        new Uri.http(_host, '/api/orden/vendedor/ver/'+id.toString()),
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
  
}
