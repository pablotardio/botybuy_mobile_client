import 'package:botybuy/pages/catalogo/productos_catalogo.dart';
import 'package:botybuy/providers/producto_provider.dart';
import 'package:botybuy/providers/recomendacion_provider.dart';
import 'package:flutter/material.dart';

class BodyRecomendaciones extends StatelessWidget {
  const BodyRecomendaciones({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _recomProvider = new RecomendacionProvider();
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductosCatalogo(
                  listarProductosFuture: _recomProvider.listarRecomendaciones())
            ],
          ),
        ),
      ),
    );
  }
}
