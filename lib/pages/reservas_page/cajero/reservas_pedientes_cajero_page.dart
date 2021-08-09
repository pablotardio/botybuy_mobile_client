
import 'package:botybuy/pages/reservas_page/vendedor/detalle_reservas_pendientes.dart';
import 'package:botybuy/providers/orden_provider.dart';
import 'package:botybuy/widgets/button_option.dart';
import 'package:botybuy/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class ReservasPendienteCajeroPage extends StatefulWidget {
  ReservasPendienteCajeroPage({Key key}) : super(key: key);

  @override
  _ReservasPendienteCajeroPageState createState() =>
      _ReservasPendienteCajeroPageState();
}

class _ReservasPendienteCajeroPageState
    extends State<ReservasPendienteCajeroPage> {
  

  final _ordenProvider = new OrdenProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagos Pendientes'),
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
      future: _ordenProvider.getPagosPendientes(),
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
        builder: (context) => 
        DetalleReservasPendientes(hasOptions: true,
          ordenId: ordenActual['id'],
          options: getOptions(ordenActual['id'],ordenActual['estado']),
        ),
      ),
    );
  }

  Widget getOptions(int id,String estado){

      final botones = {
   
    "RESERVADO": ButtonOption(
      titulo: 'Confirmar Pago',
      onPressed:() async{
        setState(() {
            //Haciendo fetch de nuevo
          });
          //volviendo atras
          Navigator.pop(context);
        await _ordenProvider.changeEstado(id,'PAGADO');
       CustomSnackBar(context, const Text('Se ha confirmado el pago de la orden' ));},
    )
  };
  return botones[estado];
  }
}
