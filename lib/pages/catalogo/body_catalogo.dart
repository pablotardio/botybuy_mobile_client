import 'package:botybuy/pages/catalogo/categorias_catalogo.dart';
import 'package:botybuy/pages/catalogo/productos_catalogo.dart';
import 'package:botybuy/providers/producto_provider.dart';
import 'package:botybuy/utils/size_config.dart';
import 'package:flutter/material.dart';

class BodyCatalogo extends StatelessWidget {
  const BodyCatalogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productoProvider = new ProductoProvider();
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CategoriasCatalogo(),
              ProductosCatalogo(
                  listarProductosFuture: _productoProvider.listarProductos())
            ],
          ),
        ),
      ),
    );
  }
}
