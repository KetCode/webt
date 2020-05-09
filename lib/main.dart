import 'package:flutter/material.dart';
import 'package:inotech/views/layout_template/layout_template.dart';
//pagina principal que chama o arquivo templeta onde tem todos as configurações da pagina inicial
import 'lacator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inotech', //titulo da pagina
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Open Sans', //fonte thema da pagina
        )  
      ),
      home: LayoutTemplate(),
    );
  }
}