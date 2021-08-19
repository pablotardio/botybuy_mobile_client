import 'package:botybuy/models/UsuarioModel.dart';
import 'package:botybuy/providers/usuario_provider.dart';
import 'package:botybuy/routes/routes.dart';
import 'package:botybuy/widgets/snackbar.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateWithParams(
              context: context,
              url: '/usuario/form',
              params: {'usuario': null});
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  List<Widget> _listarUsuarios(BuildContext context, List<dynamic> data) {
    List<Widget> listaDeProductos = [];
    List<Widget> currentRowList = [];

    data.forEach((currentUser) {
      listaDeProductos.add(
          //Componente para listar un usario
          ListTile(
        title: Text(currentUser['correo']),
        subtitle: Text(currentUser['rol']['nombre']),
        onTap: () async {},
        trailing: Row(children: [
          IconButton(
              onPressed: () async {
                await updateUsuario(currentUser, context);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.blue[500],
              )),
          IconButton(
              onPressed: () async {
                await showAlertDeleteConfirmation(currentUser, context);
              },
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

  Future<void> showAlertDeleteConfirmation(
      currentUser, BuildContext context) async {
    final alert = AlertDialog(
      title: Text('Seguro que quiere borrar el usuario ${currentUser['id']}'),
      actions: [
        TextButton(
          child: Text("Si"),
          onPressed: () async {
            await _usuarioProvider.delete(currentUser['id']);
            setState(() {});
            CustomSnackBar(context, Text('Usuario Eliminado correctamente'));
          },
        ),
        TextButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  Future<void> updateUsuario(currentUser, BuildContext context) async {
    Map<String, dynamic> userJson =
        await _usuarioProvider.read(currentUser['id']);
    UsuarioModel parsedUsuario = new UsuarioModel.fromJson(userJson);
    navigateWithParams(
        context: context,
        url: '/usuario/form',
        params: {'usuario': parsedUsuario});
  }

  // void navigateToDetail(BuildContext context, ProductoModel producto) {
  //   navigateWithParams(context:context,url:'/cliente/productos/especifico',params: { 'productId': producto.id,});

  // }
}
