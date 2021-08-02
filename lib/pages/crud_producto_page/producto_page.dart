import 'package:flutter/material.dart';

class ProductoPage extends StatefulWidget {
  ProductoPage({Key key}) : super(key: key);

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

//---------------------------------------------------------
class _ProductoPageState extends State<ProductoPage> {
  @override
  Widget build(BuildContext context) {
    final _fieldStyle = TextStyle(color: Colors.black87, fontSize: 16.0);

    InputDecoration _buildDecoration(String label) {
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.deepPurple[200]),
      );
    }

//fondo---------------------------------------
    return Scaffold(
      //key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/paqsinfondo.png"),
              fit: BoxFit.cover,
            ),
          ), //---------------------------
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            //---------------------------------------------------
            child: Column(
              children: [
                Material(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ), //---------------------------
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
