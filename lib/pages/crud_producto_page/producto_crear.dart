import 'package:flutter/material.dart';

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
            child: Image(
                height: MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                fit: BoxFit.fill,
                image: const AssetImage('assets/img/pantufla.jpg')),
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

  //----------------------------------------------------------------

// //------------------------------------------------------------------------------------------------------------------

}
