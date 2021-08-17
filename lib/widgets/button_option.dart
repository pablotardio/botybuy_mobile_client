
import 'package:flutter/material.dart';
class ButtonOption extends StatelessWidget {
  final String titulo;
  final Function onPressed;
  const ButtonOption({Key key,this.titulo,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text(titulo),
        onPressed: onPressed,
        textColor: Colors.white,
        color: Colors.purple[800]);
  }
}