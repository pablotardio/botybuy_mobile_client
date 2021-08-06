import 'package:botybuy/pages/reservas_page/detalle_reservas_pendientes.dart';
import 'package:botybuy/providers/orden_provider.dart';
import 'package:flutter/material.dart';

class ReservasPendienteVendedorPage extends StatefulWidget {
  ReservasPendienteVendedorPage({Key key}) : super(key: key);

  @override
  _ReservasPendienteVendedorPageState createState() =>
      _ReservasPendienteVendedorPageState();
}

class _ReservasPendienteVendedorPageState
    extends State<ReservasPendienteVendedorPage> {
  final botones = {
    "PENDIENTE": Row(
      children: [
        MaterialButton(child: Text('Aceptar'), onPressed: () {}),
        MaterialButton(child: Text('Cancelar'), onPressed: () {})
      ],
    ),
    "ACEPTADO":
        MaterialButton(child: Text('Confirmar Preparacion'), onPressed: () {}),
    "CANCELADO": Text('Pedido Cancelado'),
    "PREPARACION":
        MaterialButton(child: Text('Confirmar Reserva'), onPressed: () {}),
    "RESERVADO": MaterialButton(onPressed: () {}),
    "PAGADO": MaterialButton(onPressed: () {}),
    "ENTREGADO": MaterialButton(onPressed: () {}),
  };
  final _ordenProvider = new OrdenProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservas Pendientes'),
      ),
      body: getSolicitudes(),
    );
  }

  Widget getSolicitudes() {
    return FutureBuilder(
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          //snapshot.data es lo que me devuelve mi promise/future
          children: _listarSolicitudes(context, snapshot.data),
        );
      },
      future: _ordenProvider.getSolicitudes(),
    );
  }

  List<Widget> _listarSolicitudes(BuildContext context, List<dynamic> data) {
    //print(data);
    List<Widget> itemsOrden = [];
    double cuenta = 0;
    data.forEach((ordenActual) {
      itemsOrden.add(ListTile(
        title: Text(ordenActual['estado'] + '#' + ordenActual['id'].toString()),
        subtitle: Text(ordenActual['fechaPedido']),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalleReservasPendientes(
                ordenId: ordenActual['id'],
              ),
            ),
          );
        },
      ));
    });

    return itemsOrden;
  }
}
