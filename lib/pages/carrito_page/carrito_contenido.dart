import 'package:botybuy/models/Carrito.dart';
import 'package:botybuy/pages/carrito_page/carrito_card.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class CarritoContenido extends StatefulWidget {
  @override
  _CarritoContenidoState createState() => _CarritoContenidoState();
}

class _CarritoContenidoState extends State<CarritoContenido> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCarts.removeAt(index);
              });
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
            child: CarritoCard(cart: demoCarts[index]),
          ),
        ),
      ),
    );
  }
}