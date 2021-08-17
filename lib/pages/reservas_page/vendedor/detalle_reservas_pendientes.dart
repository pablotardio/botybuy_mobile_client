import 'package:botybuy/models/CarritoModel.dart';
import 'package:botybuy/pages/carrito_page/carrito_card.dart';
import 'package:botybuy/pages/reservas_page/vendedor/BottomOptions.dart';
import 'package:botybuy/providers/orden_provider.dart';
import 'package:botybuy/utils/size_config.dart';
import 'package:flutter/material.dart';

class DetalleReservasPendientes extends StatelessWidget {
  final int ordenId;
  final Widget options;
  final bool hasOptions;
  const DetalleReservasPendientes({Key key, this.ordenId, this.options,this.hasOptions=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ordenProvider = new OrdenProvider();
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de Orden')),
      body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: FutureBuilder(
            future: _ordenProvider.getDetalleOrden(this.ordenId),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView(
                //snapshot.data es lo que me devuelve mi promise/future
                children: _listarItemsOrden(context, snapshot.data),
              );
            },
          )),
          bottomNavigationBar: hasOptions?BottomOptions(options: this.options):null,
    );
    
  }
 
  List<Widget> _listarItemsOrden(BuildContext context, List<dynamic> data) {
    //print(data);
    List<Widget> itemsCarrito = [];
    double cuenta = 0;
    data.forEach((carritoActual) {
      ProductoCarrito parsedProducto = ProductoCarrito.fromJson(carritoActual);
      cuenta += parsedProducto.detalleOrden.precioUnitario *
          parsedProducto.detalleOrden.cantidad;
      itemsCarrito.add(CarritoCard(cart: parsedProducto));
      // this.asignarCuenta(cuenta);
      
    });

    return itemsCarrito;
  }
}
