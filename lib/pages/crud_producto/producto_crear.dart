import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key key}) : super(key: key);
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

//---------------------------------------------------------------------------
class _AddProductPageState extends State<AddProductPage> {
  List<String> _poderes = [
    'material escolar',
    'jugueteria',
    'peluches',
    'piscinas',
    'ejercicio',
  ];
  //lista de poderes que usare en el drop
  String _opcionSeleccionada = 'material escolar'; //valor incial
  File foto;
  bool _estaSubiendo = false;
  final imagePicker = new ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: Text('botybuy'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: [
          _input(),
          Divider(),
          _crearDescripcion(),
          Divider(),
          _crearPrecio(),
          Divider(),
          _crearImagen(),
          Divider(),
          _crearDropdown(),

          // _crearDropdown(), //opcion para hacer click y desplegar
          Divider(),
          _crearCantidad()
        ],
      ),
    );
  }

//-----------------------------------------------------------------------------------------------------
  Widget _input() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          // counter: Text('letras ${_nombre.length}'),
          hintText: 'nombre del producto',
          labelText: 'Nombre',
          helperText: 'ingresar el nombre del producto',
          //suffixIcon: Icon(Icons.access_alarm),
          icon: Icon(Icons.redeem)),
      onChanged: (valor) {
        setState(() {
          // _nombre = valor;
        });
      },
    );
  }

//------------------------------------------------------------------------------------------
  Widget _crearDescripcion() {
    return TextField(
      // keyboardType: TextInputType.emailAddress, //el teclado cambia
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Descripcion del producto',
          labelText: 'Descripcion',
          //suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.description_outlined)),
      onChanged: (valor) {
        setState(() {
          // _email = valor;
        });
      },
    );
  }

//-----------------------------------------------------
  Widget _crearPrecio() {
    return TextField(
      // obscureText: true, //oculta la informacion
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Precio',
          labelText: 'Precio',
          //suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.attach_money)),
      onChanged: (valor) {
        setState(() {
          // _email = valor;
        });
      },
    );
  }

  //----------------------------------------------
  Widget _crearCantidad() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'cantidad',
          labelText: 'Cantidad',
          //suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.data_saver_on)),
      onChanged: (valor) {
        setState(() {
          // _email = valor;
        });
      },
    );
  }

//-----------------------------------------------------------------------
  Widget _crearImagen() {
    final card = Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                _mostrarFoto(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _botonDeSubirFotos(),
                    SizedBox(
                      width: 20.0,
                    ),
                    _botonDeTomarFotos()
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Agregar imagen del producto',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold)))
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }

  _subirFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  _procesarImagen(ImageSource origen) async {
    // reemplazo al _subirFoto y _tomarFtos
//Se guarda la imagen en un picked File
    foto = await ImagePicker.pickImage(source: origen);
    if (foto != null) {
      //limpieza
    }
    setState(() {});
  }

  _mostrarFoto() {
    if (foto?.path != null) {
      return Image.file(File(foto?.path));
    } else {
      return Image(
        image: AssetImage('assets/img/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

//----------------------------------------------------------------------------------------------------------------
  List<DropdownMenuItem<String>> getOpciones() {
    // una lista de drop que internamente manejara un string
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      )); //agregar a a  la lista, el value debe ser lo que creo, en este caso strings
    });
    return lista; //regresando una lista de drops
  }

//--------------------------------------------------------------------------------------------------------------
  Widget _crearDropdown() {
    //METODO QUE HACE CLICK Y DESPLIEGA
    return Row(
      children: [
        DropdownButton(
          value: _opcionSeleccionada, //valor de la opcion actual seleccionada
          items: getOpciones(),
          onChanged: (opt) {
            setState(() {
              //redibujo
              _opcionSeleccionada =
                  opt; //la lista seleccionada es igual a la opcion seleccionada
            });
          }, //el onchanged dependera del items
        )
      ],
    );
  }

  Widget _botonDeSubirFotos() {
    return (FloatingActionButton(
      child: Icon(Icons.image),
      onPressed: _subirFoto,
    ));
  }

  Widget _botonDeTomarFotos() {
    return (FloatingActionButton(
      heroTag: 'unq1',
      child: Icon(Icons.camera_alt),
      onPressed: _tomarFoto,
    ));
  }
  //----------------------------------------------------------------

// //------------------------------------------------------------------------------------------------------------------

}
