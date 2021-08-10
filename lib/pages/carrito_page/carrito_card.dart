import 'package:botybuy/models/Carrito.dart';
import 'package:botybuy/models/CarritoModel.dart';
import 'package:flutter/material.dart';

//import '../../../constants.dart';
import '../../utils/size_config.dart';

class CarritoCard extends StatelessWidget {
  const CarritoCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final ProductoCarrito cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(cart.imagenProductos[0].url),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.nombre,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\Bs.${cart.detalleOrden.precioUnitario}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color:  Theme.of(context).primaryColor),
                children: [
                  TextSpan(
                      text: " x${cart.detalleOrden.cantidad}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}