import 'package:botybuy/models/Producto.dart';
import 'package:botybuy/providers/producto_provider.dart';
import 'package:botybuy/utils/size_config.dart';
import 'package:botybuy/widgets/productCard.dart';
import 'package:flutter/material.dart';
class ProductosCatalogo extends StatelessWidget {
  const ProductosCatalogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productoProvider=new ProductoProvider();
    return SafeArea(child: FutureBuilder(
          future: _productoProvider.listarProductos(),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Column(
             
             
              //snapshot.data es lo que me devuelve mi promise/future
              children: _listarProductos(context, snapshot.data),
            );
          },
        ));
  }
}

List<Widget> _listarProductos(BuildContext context, List<dynamic> data) {
 List<Widget>listaDeProductos=[];
 List<Widget> currentRowList=[];
  int index=1;
  data.forEach((element) {
     final parsedProducto=ProductoModel.fromJson(element);
       currentRowList.add(ProductCard(product: parsedProducto));
       if(index%2==0){
        // print(index);
         listaDeProductos.add(Row(children: currentRowList,mainAxisAlignment:MainAxisAlignment.center));
         currentRowList=[];
       }  
  
      // listaDeProductos.add(ProductCard(product: parsedProducto));

    index++;
  });
  // List.generate(
  //               data.length,
  //               (index) {
  //                   final parsedProducto=ProductoModel.fromJson(data[index]);
  //                   return ProductCard(product: parsedProducto);
  //               },
  //             );
 return listaDeProductos;
              // SizedBox(width: getProportionateScreenWidth(20)),
}
// Container(
//       child: Column(
//             children: [
//               ...List.generate(
//                 demoProducts.length,
//                 (index) {
//                   if (demoProducts[index].isPopular)
//                     return ProductCard(product: demoProducts[index]);

//                   return SizedBox
//                       .shrink(); // here by default width and height is 0
//                 },
//               ),
//               SizedBox(width: getProportionateScreenWidth(20)),
//             ],
//           ),
//     );