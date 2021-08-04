import 'package:botybuy/models/Producto.dart';
import 'package:flutter/material.dart';

//import 'Product.dart';
//import 'Product.dart';

class Carrito {
  final Producto product;
  final int numOfItem;

  Carrito({@required this.product, @required this.numOfItem});
}

// Demo data for our cart

List<Carrito> demoCarts = [
  Carrito(product: demoProducts[0], numOfItem: 2),
  Carrito(product: demoProducts[1], numOfItem: 1),
  Carrito(product: demoProducts[3], numOfItem: 1),
];