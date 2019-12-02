import 'package:flutter/material.dart';
import 'package:cicom/widgets/gradient_back.dart';
import 'package:cicom/widgets/card_image_list.dart';

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