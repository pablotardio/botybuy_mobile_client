import 'package:botybuy/pages/bot/bot_page.dart';
import 'package:botybuy/pages/carrito_page/carrito_page.dart';
import 'package:botybuy/pages/catalogo/catalogo_page.dart';
import 'package:botybuy/pages/catalogo/detalleProducto/detalle_producto_page.dart';
import 'package:botybuy/pages/crud_producto/productos_page.dart';
import 'package:botybuy/pages/home_page/home_page.dart';
import 'package:botybuy/pages/login_page/login_page.dart';
import 'package:botybuy/pages/recomendaciones/obtener_recomendaciones_page.dart';
import 'package:botybuy/pages/reservas_page/cajero/reservas_pedientes_cajero_page.dart';
import 'package:botybuy/pages/reservas_page/cliente/reservas_pedientes_cliente_page.dart';
import 'package:botybuy/pages/reservas_page/cliente/reservas_recibidas_cliente_page.dart';
import 'package:botybuy/pages/reservas_page/vendedor/entregas_pedientes_vendedor_page.dart';
import 'package:botybuy/pages/reservas_page/vendedor/reservas_pedientes_vendedor_page.dart';
import 'package:botybuy/pages/usuarios/usuario_form.dart';
import 'package:botybuy/pages/usuarios/usuarios_page.dart';
import 'package:flutter/material.dart';

/**
 * Function to open a route (widget) that have parameters
 */
navigateWithParams({context, String url, Map<String, dynamic> params}) {
  final routes = {
    '/cliente/productos/especifico': () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetalleProductoPage(
            productId: params['productId'],
          ),
        ),
      );
    },
    '/usuario/form': () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UsuarioForm(
            usuario: params['usuario'],
          ),
        ),
      );
    }
  };
  routes[url]();
}

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    '/admin/usuarios': (BuildContext context) => UsuariosPage(),
    '/admin/productos': (BuildContext context) => ProductsPage(),
    '/cliente/bot': (BuildContext context) => BotPage(),
    '/cliente/carrito': (BuildContext context) => CarritoPage(),
    '/cliente/reservas': (BuildContext context) =>
        ReservasPendienteClientePage(),
    '/cliente/compras': (BuildContext context) =>
        ReservasRecibidasClientePage(),
    '/cliente/productos': (BuildContext context) => CatalogoPage(),
    '/cliente/recomendaciones': (BuildContext context) =>
        ObtenerRecomendacionesPage(),
    '/ventas/reservas/pendientes': (BuildContext context) =>
        ReservasPendienteVendedorPage(),
    '/ventas/entregas': (BuildContext context) => EntregasVendedorPage(),
    '/cajero/reservas': (BuildContext context) => ReservasPendienteCajeroPage(),
  };
}
