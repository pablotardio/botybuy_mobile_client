import 'dart:async';
import 'dart:convert';
import 'package:botybuy/providers/env.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  String url = API_URL + 'products';

  var jsonStr = """
[{
		"id": 1,
		"nombre": "Pantuflas lilo stich 37",
		"descripcion": "Cuaderno carta top",
		"precio": "15 Bs",
		"categoria": null,
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400008/material%20escolar/cuadernocarta_shqvup.png",
		"cantidad": "2"
	},
	{
		"id": 2,
		"nombre": "Cuaderno oficio top",
		"descripcion": "Cuaderno oficio top",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400008/material%20escolar/cuadernoficio_q7vtup.png",
		"cantidad": "2"
	},
	{
		"id": 3,
		"nombre": "Paquete de hojas de papel bond carta  75gr. Chamex",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "30 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400008/material%20escolar/cartabond_sp7aax.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Borrador miga de pan grande",
		"descripcion": "Borrador miga de pan grande",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400012/material%20escolar/migapan_rwbzg7.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Resaltador Stabilo Boss pastel",
		"descripcion": "Resaltador Stabilo Boss pastel",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400011/material%20escolar/resaltador_pxnpjy.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Marcador para pizarra Monami",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400009/material%20escolar/marcadormonami_zzdrrf.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Tajador con deposito faber Castell",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400010/material%20escolar/tajadorfaber_ylwpdf.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Borrador grande artesco",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400009/material%20escolar/acrilex_ljf4jp.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 38",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400008/material%20escolar/borradorartesco_pjnzh3.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "MARCADORES FIESTA X12 FABER CASTELL",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400012/material%20escolar/marcadorfaber_zrsgev.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Muñeca lol pequeña",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400047/juguete/munecalol_e2dsp9.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Carrito de bebe mediano",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://res.cloudinary.com/pablotardio/image/upload/v1628400037/juguete/carrito_ncwc28.png",
		"cantidad": "2"
	}
]
""";

  Future<dynamic> loadProducts() async {
    // final respuesta = await http.get(url);

    // if (respuesta.statusCode == 200) {
    //   return jsonDecode(respuesta.body);
    // } else {
    //   print("Error con la respusta");
    // }
    try {
      //http.Response response = await http.get(url);
      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(jsonStr);
    } on Exception catch (_) {
      return null;
    }
  }

  //Future<List> loadProducts() async {
  //final response = await http.get();

  // http.Response response =
  //     await http.get("https://botybuy-server00.herokuapp.com/");
  // if (response.statusCode == 200) {
  //   String body = utf8.decode(response.bodyBytes)
  //   final jsonData = jsonDecode(body);
  // } else {
  //   throw Exception("fallo la conexion");
  // }

  // try {
  //   //http.Response response = await http.get(url);
  //   const JsonDecoder decoder = const JsonDecoder();
  //   return decoder.convert(jsonStr);
  // } on Exception catch (_) {
  //   return null;
  // }
  //}
}
