import 'package:botybuy/pages/bot/bot_page.dart';
import 'package:botybuy/pages/home_page/home_page.dart';
import 'package:botybuy/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';



Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    'bot': (BuildContext context) => BotPage(),
  };
}
