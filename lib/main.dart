import 'package:flutter/material.dart';
//import 'combobox01.dart';
//import 'combobox02.dart';
//import 'combobox03.dart';
//import 'image01.dart';
//import 'image02.dart';
//import 'image03.dart';
//import 'image04.dart';
import 'studikasus03.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum03',
      home: Studikasus03(),
    );
  }
}
