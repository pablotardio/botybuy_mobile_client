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
  List<Map<String,dynamic>> _categorias = [
    {'id':1,'nombre':'material escolar'},
    {'id':2,'nombre':'jugueteria'},
    {'id':3,'nombre':'peluches'},
    {'id':4,'nombre':'piscinas'},
    {'id':5,'nombre':'ejercicio'},
  ];
  //lista de poderes que usare en el drop
  int _categoriaSeleccionada = 1; //valor incial
  File fotoFile;
  bool _estaSubiendo = false;
  String nombre = '';
  String precio = '';
  String cantidad = '';
  String descripcion = '';
  final imagePicker = new ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: Text('botybuy'),
      ),floatingActionButton: FloatingActionButton(
        onPressed: () {
          _handleSubmitButton();
        },
        child: Icon(Icons.done),
        backgroundColor: Theme.of(context).primaryColor,
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
        this.nombre = valor.toString();
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
          this.descripcion = valor.toString();
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
          this.precio = valor.toString();
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
          this.cantidad = valor;
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
    fotoFile = await ImagePicker.pickImage(source: origen);
    if (fotoFile != null) {
      //limpieza
    }
    setState(() {});
  }

  _mostrarFoto() {
    if (fotoFile?.path != null) {
      return Image.file(File(fotoFile?.path));
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
  List<DropdownMenuItem<int>> getOpciones() {
    // una lista de drop que internamente manejara un string
    List<DropdownMenuItem<int>> lista = new List();
    _categorias.forEach((categoria) {
      lista.add(DropdownMenuItem(
        child: Text(categoria['nombre']),
        value: categoria['id'],
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
          value: _categoriaSeleccionada, //valor de la opcion actual seleccionada
          items: getOpciones(),
          onChanged: (opt) {
            setState(() {
              //redibujo
              _categoriaSeleccionada =
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

  void _handleSubmitButton() {
    print(this._categoriaSeleccionada);
    print(this.fotoFile.path);
    print(this.nombre);
    print(this.precio);
    print(this.descripcion);
    print(this.cantidad);
  }
  //----------------------------------------------------------------

// //------------------------------------------------------------------------------------------------------------------

}
