import 'package:botybuy/pages/catalogo/productos_catalogo.dart';
import 'package:botybuy/providers/producto_provider.dart';
import 'package:flutter/material.dart';

class BodyCatalogoCategoria extends StatelessWidget {
  final int categoriaId;
  const BodyCatalogoCategoria({Key key, this.categoriaId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productoProvider = new ProductoProvider();
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductosCatalogo(
                  listarProductosFuture: _productoProvider
                      .listarProductosPorCategoria(categoriaId))
            ],
          ),
        ),
      ),
    );
  }
}
