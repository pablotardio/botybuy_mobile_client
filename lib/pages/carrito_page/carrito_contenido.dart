import 'dart:async';

import 'package:botybuy/models/Carrito.dart';
import 'package:botybuy/models/CarritoModel.dart';
import 'package:botybuy/pages/carrito_page/carrito_card.dart';
import 'package:botybuy/providers/carrito_provider.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';

class CarritoContenido extends StatelessWidget {
  final Function(double) asignarCuenta;
  const CarritoContenido({Key key, this.asignarCuenta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _carritoProvider = new CarritoProvider();
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder(
          future: _carritoProvider.getAllCarritos(),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView(
              //snapshot.data es lo que me devuelve mi promise/future
              children: _listarItemsCarrito(context, snapshot.data),
            );
          },
        ));
  }

  List<Widget> _listarItemsCarrito(BuildContext context, List<dynamic> data) {
    //print(data);
    final _carritoProvider = new CarritoProvider();
    List<Widget> itemsCarrito = [];
    double cuenta = 0;
    data?.forEach((carritoActual) {
      ProductoCarrito parsedProducto = ProductoCarrito.fromJson(carritoActual);
      cuenta += parsedProducto.detalleOrden.precioUnitario *
          parsedProducto.detalleOrden.cantidad;
      itemsCarrito.add(Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Dismissible(
          key: Key(parsedProducto.id.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            _carritoProvider.removeFromCarrito(
                parsedProducto.detalleOrden.productoId,
                parsedProducto.detalleOrden.ordenId);
            // setState(() {
            //   // demoCarts.removeAt(carritoActual.id);
            // });
          },
          background: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFFFFE6E6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Spacer(),
                Icon(Icons.delete),
              ],
            ),
          ),
          child: CarritoCard(cart: parsedProducto),
        ),
      ));
    });
    this.asignarCuenta(cuenta);
    return itemsCarrito;
  }
}
