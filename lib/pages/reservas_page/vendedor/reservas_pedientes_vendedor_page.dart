import 'package:botybuy/pages/reservas_page/vendedor/detalle_reservas_pendientes.dart';
import 'package:botybuy/providers/orden_provider.dart';
import 'package:botybuy/widgets/button_option.dart';
import 'package:botybuy/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class ReservasPendienteVendedorPage extends StatefulWidget {
  ReservasPendienteVendedorPage({Key key}) : super(key: key);

  @override
  _ReservasPendienteVendedorPageState createState() =>
      _ReservasPendienteVendedorPageState();
}

class _ReservasPendienteVendedorPageState
    extends State<ReservasPendienteVendedorPage> {
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
          ordenId: ordenActual['id'],
          options: getOptions(ordenActual['id'], ordenActual['estado']),
        ),
      ),
    );
  }

  Widget getOptions(int id, String estado) {
    final botones = {
      "PENDIENTE": Row(
        children: [
          ButtonOption(
            titulo: 'Aceptar',
            onPressed: () async {
              await _ordenProvider.changeEstado(id, 'ACEPTADO');
               updateViewAndNavigateBack();
              CustomSnackBar(context, const Text('Se ha aceptado la orden'));
            },
          )
        ],
      ),
      "ACEPTADO": ButtonOption(
        titulo: 'Confirmar Preparacion',
        onPressed: () async {

          await _ordenProvider.changeEstado(id, 'PREPARACION');
           updateViewAndNavigateBack();
          CustomSnackBar(
              context,
              const Text(
                  'Se ha confirmado el comienzo de preparacion de la orden'));
        },
      ),
      "CANCELADO": Text('Pedido Cancelado'),
      "PREPARACION": ButtonOption(
        titulo: 'Confirmar Reserva',
        onPressed: () async {
          await _ordenProvider.changeEstado(id, 'RESERVADO');
          updateViewAndNavigateBack();
          CustomSnackBar(context,
              const Text('Se ha confirmado la reserva de la orden lista'));
        },
      ),
      "RESERVADO": MaterialButton(onPressed: () {}, color: Colors.purple[800]),
      "PAGADO": MaterialButton(onPressed: () {}, color: Colors.purple[800]),
      "ENTREGADO": MaterialButton(onPressed: () {}, color: Colors.purple[800]),
    };
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
