import 'package:botybuy/pages/bot/bot_page.dart';
import 'package:botybuy/pages/carrito_page/carrito_page.dart';
import 'package:botybuy/pages/home_page/home_page.dart';
import 'package:botybuy/pages/login_page/login_page.dart';
import 'package:botybuy/pages/reservas_page/cajero/reservas_pedientes_cajero_page.dart';
import 'package:botybuy/pages/reservas_page/cliente/reservas_pedientes_cliente_page.dart';
import 'package:botybuy/pages/reservas_page/cliente/reservas_recibidas_cliente_page.dart';
import 'package:botybuy/pages/reservas_page/vendedor/entregas_pedientes_vendedor_page.dart';
import 'package:botybuy/pages/reservas_page/vendedor/reservas_pedientes_vendedor_page.dart';
import 'package:flutter/material.dart';



Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    '/cliente/bot': (BuildContext context) => BotPage(),
    '/cliente/carrito': (BuildContext context) => CarritoPage(),
    '/ventas/reservas/pendientes': (BuildContext context) => ReservasPendienteVendedorPage(),
    '/ventas/entregas': (BuildContext context) => EntregasVendedorPage(),
    '/cliente/reservas': (BuildContext context) => ReservasPendienteClientePage(),
    '/cliente/compras': (BuildContext context) => ReservasRecibidasClientePage(),
    '/cajero/reservas': (BuildContext context) => ReservasPendienteCajeroPage(),
  };
}
