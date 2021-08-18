import 'package:botybuy/providers/usuario_provider.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatefulWidget {
  UsuariosPage({Key key}) : super(key: key);

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final _usuarioProvider = new UsuarioProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
      ),
      body: FutureBuilder(
        future: _usuarioProvider.listarUsuarios(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            //snapshot.data es lo que me devuelve mi promise/future
            children: _listarUsuarios(context, snapshot.data),
          );
        },
      ),
    );
  }

  List<Widget> _listarUsuarios(BuildContext context, List<dynamic> data) {
    List<Widget> listaDeProductos = [];
    List<Widget> currentRowList = [];

    data.forEach((currentUser) {
      listaDeProductos.add(ListTile(
        title: Text(currentUser['correo']),
        subtitle: Text(currentUser['rol']['nombre']),
        trailing: Row(children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.blue[500],
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red[500],
              )),
        ], mainAxisSize: MainAxisSize.min),
      ));
    });

    return listaDeProductos;
    // SizedBox(width: getProportionateScreenWidth(20)),
  }

  // void navigateToDetail(BuildContext context, ProductoModel producto) {
  //   navigateWithParams(context:context,url:'/cliente/productos/especifico',params: { 'productId': producto.id,});

  // }
}
