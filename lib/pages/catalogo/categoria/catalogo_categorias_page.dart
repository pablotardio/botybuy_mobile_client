import 'package:botybuy/pages/catalogo/categoria/body_catalogo_categoria.dart';
import 'package:flutter/material.dart';

class CatalogoCategoriaPage extends StatelessWidget {
  final int categoriaId;
  final String categoriaNombre;
  const CatalogoCategoriaPage({Key key,@required this.categoriaId,this.categoriaNombre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('${this.categoriaNombre}'),),
      body:BodyCatalogoCategoria(categoriaId: categoriaId)
    );
  }
}