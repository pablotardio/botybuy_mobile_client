import 'package:botybuy/pages/reservas_page/vendedor/detalle_reservas_pendientes.dart';
import 'package:botybuy/providers/orden_provider.dart';
import 'package:botybuy/widgets/button_option.dart';
import 'package:botybuy/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class ReservasPendienteClientePage extends StatefulWidget {
  ReservasPendienteClientePage({Key key}) : super(key: key);

  @override
  _ReservasPendienteClientePageState createState() =>
      _ReservasPendienteClientePageState();
}

class _ReservasPendienteClientePageState
    extends State<ReservasPendienteClientePage> {
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
      future: _ordenProvider.getMisSolicitudesCliente(),
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
           hasOptions:  ordenActual['estado']=='PENDIENTE'?true:false,
          ordenId: ordenActual['id'],
          options: getOptions(ordenActual['id'], ordenActual['estado']),
        ),
      ),
    );
  }

  Widget getOptions(int id, String estado) {
    final botones = { "PENDIENTE": Row(
        children: [
          ButtonOption(
            titulo: 'Cancelar mi Pedido',
            onPressed: () async {
              await _ordenProvider.changeEstado(id, 'CANCELADO');
               updateViewAndNavigateBack();
              CustomSnackBar(context, const Text('Se ha Cancelado la orden'));
            },
          ),
        ],
      )}; //El cliente no tiene botones, solo ve
    return botones[estado];
  }
      void updateViewAndNavigateBack() {
    setState(() {
      //Haciendo fetch de nuevo
    });
    //volviendo atras
    Navigator.pop(context);
  }
}
