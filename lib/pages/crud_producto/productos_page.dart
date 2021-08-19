import 'package:botybuy/models/Producto.dart';
import 'package:botybuy/pages/crud_producto/product_card.dart';
import 'package:botybuy/pages/crud_producto/producto_crear.dart';
import 'package:botybuy/providers/producto_provider.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

//---------------------------------------------------------------------------
class _ProductsPageState extends State<ProductsPage> {
  ScrollController _scrollController;
  final _productoProvider = new ProductoProvider();
  List<ProductoModel> _products = [];
  List<ProductoModel> _products_2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: Text('Botybuy'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            tooltip: 'Agregar Producto',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductPage()),
              );
            },
          )
        ],
      ),
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              controller: _scrollController,
              child: ProductListBody(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF745ba1),
        mini: true,
        onPressed: _scrollToTop,
        child: Icon(Icons.arrow_upward),
      ),
    );
  }

  Widget listOfProducts(products) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: products.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return products[index];
        });
  }

  Widget ProductListBody() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Color(0xFFFEFEFE),
        ),
        padding: EdgeInsets.only(top: 26, left: 10, right: 10, bottom: 100),
        child: FutureBuilder(
          future: this._productoProvider.listarProductos(),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Column(
              //snapshot.data es lo que me devuelve mi promise/future
              children: [
                SizedBox(height: 20.0),
                Column(
                  children: _listarProductosMenu(context, snapshot.data),
                )
              ],
            );
          },
        ) //
        ,
      ),
    );
  }

//_listarProductos(context, snapshot.data)
  List<Widget> _listarProductosMenu(BuildContext context, List<dynamic> data) {
    List<Widget> listaDeProductos = [];
    List<Widget> currentRowList = [];
    int index = 1;
    // listaDeProductos.add(Container(
    //   padding: EdgeInsets.only(left: 10, right: 10),
    //   height: 50.0,
    //   child: searchBox(),
    // ));

    if (data.isNotEmpty) {
      data.forEach((element) {
        final parsedProducto = ProductoModel.fromJson(element);
        // listaDeProductos.add(listOfProducts(data));
        listaDeProductos.add(ProductListCard(producto: parsedProducto));
        index++;
      });
    } else {
      listaDeProductos
          .add(const Center(child: const CircularProgressIndicator()));
    }

    return listaDeProductos;
    // SizedBox(width: getProportionateScreenWidth(20)),
  }

  Widget searchBox() {
    return TextField(
      onChanged: (value) {
        filterSearchResults(value.toLowerCase());
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Buscar Producto',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.0),
          borderSide: BorderSide(color: Color(0xFF78C470), width: 0.8),
        ),
      ),
      style: TextStyle(fontSize: 16.0),
    );
  }

  void filterSearchResults(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(_products);
    if (query.isNotEmpty) {
      List<ProductoModel> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.getNombre().toString().toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _products_2.clear();
        _products_2.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _products_2.clear();
        _products_2.addAll(_products);
      });
    }
  }

  @override
  void initState() {
    // loadProducts();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  // loadProducts() async {
  //   _productoProvider.listarProductos().then((result) {
  //     if (result != null) {
  //       setState(() {
  //         result.forEach((item) {
  //           var product = new ProductoModel(
  //             // item['id'],
  //             item['nombre'],
  //             item['descripcion'],
  //             item['precio'],
  //             item['categoria'],
  //             item['foto'],
  //             item['cantidad'],
  //             //item['tiendaId'],
  //           );
  //           _products.add(product);
  //           _products_2.add(product);
  //         });
  //       });
  //     }
  //   });
  // }
}
