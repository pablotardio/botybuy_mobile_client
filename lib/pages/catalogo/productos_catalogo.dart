import 'package:botybuy/models/Producto.dart';
import 'package:botybuy/pages/catalogo/detalleProducto/detalle_producto_page.dart';
import 'package:botybuy/providers/producto_provider.dart';
import 'package:botybuy/utils/size_config.dart';
import 'package:botybuy/widgets/productCard.dart';
import 'package:flutter/material.dart';

class ProductosCatalogo extends StatelessWidget {
  final Future<List<dynamic>> listarProductosFuture;
  const ProductosCatalogo({Key key,this.listarProductosFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
        child: FutureBuilder(
      future:this.listarProductosFuture,
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          //snapshot.data es lo que me devuelve mi promise/future
          children: _listarProductos(context, snapshot.data),
        );
      },
    ));
  }

  List<Widget> _listarProductos(BuildContext context, List<dynamic> data) {
    List<Widget> listaDeProductos = [];
    List<Widget> currentRowList = [];
    int index = 1;
    data.forEach((element) {
     
      final parsedProducto = ProductoModel.fromJson(element);
       print(parsedProducto);
      currentRowList.add(ProductCard(
        product: parsedProducto,
        onTap: () {
          navigateToDetail(context, parsedProducto);
        },
      ));
      if (index % 2 == 0) {
        // print(index);
        listaDeProductos.add(Row(
            children: currentRowList,
            mainAxisAlignment: MainAxisAlignment.center));
        currentRowList = [];
      }

      // listaDeProductos.add(ProductCard(product: parsedProducto));

      index++;
    });


    return listaDeProductos;
    // SizedBox(width: getProportionateScreenWidth(20)),
  }

  void navigateToDetail(BuildContext context, ProductoModel producto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleProductoPage(
          productId: producto.id,
         
        ),
      ),
    );
  }
}
