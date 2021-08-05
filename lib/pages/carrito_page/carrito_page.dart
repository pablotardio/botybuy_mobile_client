import 'package:botybuy/models/Carrito.dart';
import 'package:botybuy/pages/carrito_page/carrito_checkout.dart';
import 'package:botybuy/pages/carrito_page/carrito_contenido.dart';
import 'package:flutter/material.dart';


class CarritoPage extends StatelessWidget {
  static String routeName = "/cliente/carrito";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
     body: CarritoContenido(),
    bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Tu carrito"
          ),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}