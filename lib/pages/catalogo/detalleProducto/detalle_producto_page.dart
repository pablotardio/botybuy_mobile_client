import 'package:botybuy/models/Producto.dart';
import 'package:botybuy/pages/catalogo/detalleProducto/product_description.dart';
import 'package:botybuy/pages/catalogo/detalleProducto/product_images.dart';
import 'package:botybuy/pages/catalogo/detalleProducto/top_rounded_container.dart';
import 'package:botybuy/providers/producto_provider.dart';
import 'package:botybuy/utils/size_config.dart';
import 'package:botybuy/widgets/default_button.dart';
import 'package:flutter/material.dart';

class DetalleProductoPage extends StatelessWidget {
  const DetalleProductoPage({Key key, this.productId}) : super(key: key);
  final int productId;
  @override
  Widget build(BuildContext context) {
    final _productoProvider = new ProductoProvider();
    var defaultProduct = ProductoModel(
                  cantidad: 0,
                  precio: 0,
                  descripcion: '',
                  id: -1,nombre: '',tiendaId: 2,
                  categoria:[Categoria(nombre: '')],
                  imagenProductos: [
                    ImagenProductos(
                        url:
                            "https://i.pinimg.com/originals/71/3a/32/713a3272124cc57ba9e9fb7f59e9ab3b.gif")
                  ]).toJson();
    return Scaffold(
        appBar: AppBar(title: Text('Detalle de Orden')),
        backgroundColor: Color(0xFFF5F6F9),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: FutureBuilder(
              future: _productoProvider.getDetalle(this.productId),
              initialData: defaultProduct,

              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ListView(
                  //snapshot.data es lo que me devuelve mi promise/future
                  children: _getDetalleProducto(context, snapshot.data),
                );
              },
            )));
  }

  List<Widget> _getDetalleProducto(
      BuildContext context, Map<String, dynamic> data) {
    final ProductoModel product = ProductoModel.fromJson(data);
    return [
      ProductImages(product: product),
      ProductDescription(
        product: product,
        pressOnSeeMore: () {},
      ),
      TopRoundedContainer(
        color: Color(0xFFF6F7F9),
        child: Column(
          children: [
            TopRoundedContainer(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.15,
                  right: SizeConfig.screenWidth * 0.15,
                  bottom: getProportionateScreenWidth(40),
                  top: getProportionateScreenWidth(15),
                ),
                child: DefaultButton(
                  text: "Añadir al carrito",
                  press: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
