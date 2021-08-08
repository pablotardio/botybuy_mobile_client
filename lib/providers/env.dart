import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';

const API_URL = 'botybuy-server00.herokuapp.com';
getHeaders() {
  final prefs = new PreferenciasUsuario();
  final headers = {
    "Content-Type": "application/json",
    "authorization": 'bearer ' + prefs.token
  };
  return headers;
}
