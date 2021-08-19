import 'package:botybuy/providers/producto_provider.dart';
import 'package:flutter/material.dart';

import 'admin_productos_catalogo.dart';

class AdminBodyCatalogo extends StatelessWidget {
  const AdminBodyCatalogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productoProvider = new ProductoProvider();
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //CategoriasCatalogo(),
              AdminProductosCatalogo(
                  listarProductosFuture: _productoProvider.listarProductos())
            ],
          ),
        ),
      ),
    );
  }
}
