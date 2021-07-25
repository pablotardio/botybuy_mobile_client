import 'package:botybuy/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';



Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
  };
}
