import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardImage extends StatelessWidget{

  String urlImage="https://rita.udistrital.edu.co/cicom/public/public/files/images/cicom-cicom2019-1570401647426930469.png";

  CardImage(this.urlImage);
  
  @override
  Widget build(BuildContext context) {
    final card=Container(
      height: 200.0,
      width: 300.0,
      margin: EdgeInsets.only(
        top: 80.0,
        left: 20.0
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(urlImage)
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 30.0,
            offset: Offset(0.0,7.0)
          )
        ]
      ),
    );
    return card;
  }

}