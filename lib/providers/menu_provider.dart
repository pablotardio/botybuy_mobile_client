import 'dart:convert';

import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';
import 'package:flutter/services.dart' show rootBundle;

class MenuProvider {
  List<dynamic> opciones = [];
  final prefs = new PreferenciasUsuario();
  MenuProvider() {
    cargarData();
  }
  Future<List<dynamic>> cargarData() async {
    Map dataMap = await json.decode(prefs.vistas);
    opciones = dataMap['vistas'];
    return opciones;
  }
}

MenuProvider menuProvider = new MenuProvider();
