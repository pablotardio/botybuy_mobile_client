import 'package:botybuy/pages/reservas_page/vendedor/detalle_reservas_pendientes.dart';
import 'package:botybuy/providers/orden_provider.dart';
import 'package:botybuy/widgets/button_option.dart';
import 'package:botybuy/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class ReservasRecibidasClientePage extends StatefulWidget {
  ReservasRecibidasClientePage({Key key}) : super(key: key);

  @override
  _ReservasRecibidasClientePageState createState() =>
      _ReservasRecibidasClientePageState();
}

class _ReservasRecibidasClientePageState
    extends State<ReservasRecibidasClientePage> {
  final _ordenProvider = new OrdenProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservas Compradas/Recibidas'),
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
      future: _ordenProvider.getMisComprasCliente(),
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
          NavigateInDetalle(context, ordenActual);
        },
      ));
    });

    return itemsOrden;
  }

  void NavigateInDetalle(BuildContext context, ordenActual) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleReservasPendientes(
          // hasOptions: false,
          ordenId: ordenActual['id'],
          options: getOptions(ordenActual['id'], ordenActual['estado']),
        ),
      ),
    );
  }

  Widget getOptions(int id, String estado) {
    final botones = {}; //El cliente no tiene botones, solo ve
    return botones[estado];
  }

}
