import 'package:flutter/material.dart';
import 'package:cicom/screens/gradient_back.dart';
import 'package:cicom/screens/card_image_list.dart';

class HeaderAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack("Cicom App",250),
        CardImageList()
      ],
    );
  }

}