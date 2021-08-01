import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductoPreview extends StatelessWidget {
  //const ProductoPreview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: <Widget>[
            //imagen con su sombra
            _ProductoSombra(),

            _ProductoTalla()
          ],
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------------
class _ProductoTalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _cajablanca('tamaño'),
          _cajablanca('30 cm'),
        ],
      ),
    );
  }
}

class _cajablanca extends StatelessWidget {
  final String numero;

  const _cajablanca(this.numero);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '$numero',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      width: 80,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}

//------------------------------------------
//scafol donde ira la imagen y su sombra
class _ProductoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Stack(
        //imagen
        children: [
          //sombra

          Positioned(
            bottom: 5,
            child: _sombra(),
          ),

          //imagen
          Image(image: AssetImage('assets/img/pansinfondo.png'))
        ],
      ),
    );
  }
}

class _sombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.8,
      child: Container(
        width: 230,
        height: 140,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(color: Colors.blueGrey[400], blurRadius: 40)
            ]),
      ),
    );
  }
}
