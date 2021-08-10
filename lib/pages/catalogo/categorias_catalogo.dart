import 'package:botybuy/providers/categoria_provider.dart';
import 'package:botybuy/utils/size_config.dart';
import 'package:flutter/material.dart';

class CategoriasCatalogo extends StatelessWidget {
  const CategoriasCatalogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _categoriaProvider = new CategoriaProvider();
    return SafeArea(
        child: FutureBuilder(
      future: _categoriaProvider.listarCategorias(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            //snapshot.data es lo que me devuelve mi promise/future
            children: _listarWidgetsCategoria(context, snapshot.data),
          ),
        );
      },
    ));
  }
}

List<Widget> _listarWidgetsCategoria(
    BuildContext context, List<dynamic> categoriesData) {
  Map<String, IconData> categoryIcons = {
    "Material escolar": Icons.book,
    "Jugueteria": Icons.toys,
    "Peluches": Icons.volunteer_activism,
    "Piscinas": Icons.pool,
    "Ejercicio": Icons.fitness_center,
  };
  return List.generate(
    categoriesData.length,
    (index) => CategoryCard(
      icon: categoryIcons[categoriesData[index]["nombre"]],
      text: categoriesData[index]["nombre"],
      press: () {},
    ),
  );
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon,color:Colors.white,),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
