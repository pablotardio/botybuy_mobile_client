import 'package:botybuy/pages/bot/bot_page.dart';
import 'package:botybuy/pages/crud_producto_page/producto_crear.dart';
import 'package:botybuy/pages/crud_producto_page/producto_page.dart';
import 'package:botybuy/pages/crud_producto_page/producto_ver.dart';
import 'package:botybuy/pages/home_page/home_page.dart';
import 'package:botybuy/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    '/cliente/bot': (BuildContext context) => BotPage(),
    'producto': (BuildContext context) => ProductoPage(),
    'agregarProducto': (BuildContext context) => AddProductPage(),
    'verproducto': (BuildContext contect) => ShowProductPage(),
  };
}
