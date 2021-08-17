import 'dart:async';

import 'package:botybuy/models/Carrito.dart';
import 'package:botybuy/pages/carrito_page/carrito_checkout.dart';
import 'package:botybuy/pages/carrito_page/carrito_contenido.dart';
import 'package:flutter/material.dart';

class CarritoPage extends StatefulWidget {
  CarritoPage({Key key}) : super(key: key);
static String routeName = "/cliente/carrito";
  @override
  _CarritoPageState createState() => _CarritoPageState();
}
double _cuentaCarrito;
class _CarritoPageState extends State<CarritoPage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
     body: CarritoContenido(asignarCuenta:asignarCuenta),
    bottomNavigationBar: CheckoutCard(cuentaCarrito:_cuentaCarrito),
    );
  }

  void asignarCuenta(double cuenta){
    
      _cuentaCarrito=cuenta;
   
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Tu carrito"
          ),
          // Text(
          //   "${demoCarts.length} items",
          //   style: Theme.of(context).textTheme.caption,
          // ),
        ],
      ),
    );
  }
}
