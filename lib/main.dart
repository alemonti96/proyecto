import 'package:flutter_application_proyecto/src/pages/home_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  'Componentes App',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}