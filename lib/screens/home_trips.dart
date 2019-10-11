import 'package:cicom/screens/description_place.dart';
import 'package:cicom/screens/header_appbar.dart';
import 'package:flutter/material.dart';

class HomeTrips extends StatelessWidget{
  final String descriptionText='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Bienvenido a Cicom",descriptionText),
          ],
        ),
        HeaderAppBar(),
      ],
    );
  }

}