import 'package:botybuy/pages/reservas_page/vendedor/detalle_reservas_pendientes.dart';
import 'package:botybuy/providers/orden_provider.dart';
import 'package:botybuy/widgets/button_option.dart';
import 'package:botybuy/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class EntregasVendedorPage extends StatefulWidget {
  EntregasVendedorPage({Key key}) : super(key: key);

  @override
  _EntregasVendedorPageState createState() => _EntregasVendedorPageState();
}

class _EntregasVendedorPageState extends State<EntregasVendedorPage> {
  final _ordenProvider = new OrdenProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entregas Pendientes'),
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
      future: _ordenProvider.getEntregasPendientes(),
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
      "PAGADO": ButtonOption(
        titulo: 'Confirmar Entrega',
        onPressed: () async {
          setState(() {
            //Haciendo fetch de nuevo
          });
          //volviendo atras
          Navigator.pop(context);
          await _ordenProvider.changeEstado(id, 'ENTREGADO');
          setState(() {
            
          });
          CustomSnackBar(
              context, const Text('Se ha confirmado la entrega de la orden'));
        },
      ),
      
      //"ENTREGADO": MaterialButton(onPressed: () {}, color: Colors.purple[800]),
    };
    return botones[estado];
  }
}
