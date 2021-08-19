import 'package:botybuy/models/Producto.dart';
import 'package:flutter/material.dart';

class ProductListCard extends StatelessWidget {
  final ProductoModel producto;
  //var tiendaId;

  // void showDetail() {
  //   Navigator.of(_context)
  //       .push(new MaterialPageRoute(builder: (BuildContext context) {
  //     return new PostDetail(this.title, this.shortDescription, this._content,
  //         this.imageUrl, this.createdAt);
  //   }));
  // }

  

  // Product(this.id, this.nombre, this.descripcion, this.precio, this.categoria,
  //     this.foto, this.cantidad);
  ProductListCard({this.producto});

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return GestureDetector(
      onTap: () {
        print("hola");
      },
      child: Container(
        margin: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 10.0, top: 0.0),
        child: new Container(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(15),
            elevation: 10,
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                  title: Text(producto.nombre),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
                    child: Image.network(producto.imagenProductos[0].url, fit: BoxFit.cover),
                  ),
                  subtitle: Text(producto.descripcion!=null?producto.descripcion:''),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(onPressed: () => {}, child: Text('Editar')),
                    FlatButton(onPressed: () => {}, child: Text('Eliminar'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
