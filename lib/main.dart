import 'package:botybuy/pages/bot/bot_page.dart';
import 'package:botybuy/routes/routes.dart';
import 'package:botybuy/shared_prefs/preferencias_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:botybuy/pages/login_page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  prefs.initPrefs();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Botybuy',
      initialRoute: 'login',
      home: BotPage(),
      theme: ThemeData(primaryColor: Colors.purple[800]),
      routes: getApplicationRoutes()
    );
  }
}
