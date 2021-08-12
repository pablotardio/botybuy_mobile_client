import 'package:botybuy/pages/recomendaciones/body_recomendaciones.dart';
import 'package:flutter/material.dart';

class ObtenerRecomendacionesPage extends StatelessWidget {
  const ObtenerRecomendacionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recomendaciones'),),
      body: BodyRecomendaciones()
    );
  }
}