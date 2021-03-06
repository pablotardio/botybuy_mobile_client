import 'package:botybuy/models/Producto.dart';
import 'package:botybuy/utils/size_config.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final ProductoModel product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.nombre,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            // decoration: BoxDecoration(
            //   color:
            //       product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(20),
            //     bottomLeft: Radius.circular(20),
            //   ),
            // ),
            // child: SvgPicture.asset(
            //   "assets/icons/Heart Icon_2.svg",
            //   color:
            //       product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
            //   height: getProportionateScreenWidth(16),
            // ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            (product.descripcion) != null ? product.descripcion : '',
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  child: Row(children: [Text(
                  'Precio: ${this.product.precio} Bs.',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),],),
                ),
               
                // Icon(
                //   Icons.arrow_forward_ios,
                //   size: 12,
                //   color: Theme.of(context).primaryColor,
                // ),
                
                Container(
                  child: Row(
                    children: [
                      Text(
                        'En Stock: ${this.product.cantidad}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        getCategorySection(context)
      ],
    );
  }

  Padding getCategorySection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              'Categorias:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            ),
            Row(
              children: List.generate(product.categoria.length, (index) {
                return Chip(label: Text(product.categoria[index].nombre));
              }),
            )
          ],
        ),
      );
  }
}
