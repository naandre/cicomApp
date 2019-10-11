import 'package:cicom/screens/gradient_back.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack("Mi Perfil", 250)
      ],
    );
  }

}