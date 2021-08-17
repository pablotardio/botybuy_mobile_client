import 'package:botybuy/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final menuProvider = new MenuProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botybuy'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _menuLista(),
    );
  }

  Widget _menuLista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          //snapshot.data es lo que me devuelve mi promise/future
              children: _listMenuItems(context, snapshot.data),
            );
      },
    );
  }

  List<Widget> _listMenuItems(BuildContext context, List<dynamic> data) {
    final List<Widget> myItems = [];
    myItems.add(_fotoDePerfil());  
    myItems.add(Center(child: Text('Bienvenido!'),));
        data.forEach((element) {
          myItems.add(ListTile(
            title: Text(element['titulo']),
            // subtitle: Text('Esto es un item del menu'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              //para navegar entre rutas
              Navigator.pushNamed(context, element['url']);
            },
          ));
        });
        return myItems;
      }
    
      Widget _fotoDePerfil() {
        return Icon(Icons.person,size: 140.0,color: Theme.of(context).primaryColor);
      }
}
