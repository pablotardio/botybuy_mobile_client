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
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 37",
		"precio": "130 Bs",
		"categoria": "Pantuflas",
		"foto": "https://picsum.photos/250?image=9",
		"cantidad": "2"
	},
	{
		"id": 2,
		"nombre": "Pantuflas lilo stich 38",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://picsum.photos/253?image=4",
		"cantidad": "2"
	},
	{
		"id": 3,
		"nombre": "Pantuflas lilo stich 39",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://picsum.photos/252?image=3",
		"cantidad": "2"
	},
	{
		"id": 4,
		"nombre": "Pantuflas lilo stich 3666",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://picsum.photos/250?image=7",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 767",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://picsum.photos/251?image=5",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 67",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://picsum.photos/250?image=9",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 38",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://picsum.photos/250?image=9",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 38",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://picsum.photos/250?image=9",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 38",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://github.com/agarasul/SampleNewsApp/raw/master/empty_image.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 38",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://github.com/agarasul/SampleNewsApp/raw/master/empty_image.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 38",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://github.com/agarasul/SampleNewsApp/raw/master/empty_image.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 38",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://github.com/agarasul/SampleNewsApp/raw/master/empty_image.png",
		"cantidad": "2"
	},
  {
		"id": 4,
		"nombre": "Pantuflas lilo stich 38",
		"descripcion": "Son unas lindas pantuflas de lilo y stich talla 38",
		"precio": "140 Bs",
		"categoria": "Pantuflas",
		"foto": "https://github.com/agarasul/SampleNewsApp/raw/master/empty_image.png",
		"cantidad": "2"
	}
]
""";

  Future<List> loadProducts() async {
    // try {
    //   http.Response response = await http.get(url);
    //   const JsonDecoder decoder = const JsonDecoder();
    //   return decoder.convert(response.body);
    // } on Exception catch (_) {
    //   return null;
    // }

    try {
      //http.Response response = await http.get(url);
      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(jsonStr);
    } on Exception catch (_) {
      return null;
    }
  }
}
