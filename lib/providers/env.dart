import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';
const env='local';
const API_URL = env=='prod'?'botybuy-server00.herokuapp.com':'192.168.1.2:3002';
getHeaders() {
  final prefs = new PreferenciasUsuario();
  final headers = {
    "Content-Type": "application/json",
    "authorization": 'bearer ' + prefs.token
  };
  return headers;
}
