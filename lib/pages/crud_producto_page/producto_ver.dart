import 'package:botybuy/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class ShowProductPage extends StatefulWidget {
  ShowProductPage({Key key}) : super(key: key);
  @override
  _ShowProductPageState createState() => _ShowProductPageState();
}

class _ShowProductPageState extends State<ShowProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: CustomAppBar(),
      //body: ProductoPreview(),
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ProductoPreview(),
                ProductoDescripcion(
                    titulo: 'Pantufla',
                    descripcion:
                        'material de peluche antialergico, color azul , diseño de disney, la base no es engomada sino que es de tela antideslizante y la base tiene una medida de 26 cm de largo')
              ],
            ),
          )),
        ],
      ),
    );
  }
}
