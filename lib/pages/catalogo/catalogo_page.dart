import 'package:botybuy/pages/catalogo/body_catalogo.dart';
import 'package:flutter/material.dart';
class CatalogoPage extends StatefulWidget {
  CatalogoPage({Key key}) : super(key: key);

  @override
  _CatalogoPageState createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogo de Productos'),
      ),

      body: BodyCatalogo(),

    );
  }
}