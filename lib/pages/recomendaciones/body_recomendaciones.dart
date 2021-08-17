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
              Image(
                    height:
                        MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                    fit: BoxFit.fill,
                    image: const AssetImage('assets/img/recommendations.png')),
              Text('Te recomendamos los siguientes productos!',style: TextStyle(
    
                      fontSize: 16.0,
                      fontFamily: 'WorkSansSemiBold')),
              ProductosCatalogo(
                  listarProductosFuture: _recomProvider.listarRecomendaciones())
            ],
          ),
        ),
      ),
    );
  }
}
