import 'package:cicom/screens/menu_trips_cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application. #0073a1
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cicom App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuTripsCupertino(),
    );
  }
}