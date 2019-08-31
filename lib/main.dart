import 'package:flutter/material.dart';
import 'package:english_app/views/CategoryPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.brown,
        primaryColorDark: Colors.black
      ),
      home: CategoryPage(),
    );
  }
}

