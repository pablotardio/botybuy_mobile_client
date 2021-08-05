import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';

const API_URL = '192.168.1.2:3002';
getHeaders() {
  final prefs = new PreferenciasUsuario();
  final headers = {
    "Content-Type": "application/json",
    "authorization": 'bearer ' + prefs.token
  };
  return headers;
}
