import 'package:flutter/material.dart';
import 'package:flutter_valuelistnablebuilder/value_listenable_builder_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Value Listenable Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ValueListenableBuilderExample(),
    );
  }
}
