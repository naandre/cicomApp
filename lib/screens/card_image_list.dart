import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cicom/screens/card_image.dart';
class CardImageList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("http://cicom.miscursosweb.com.co/public/public/files/images/cicom-cicom2019-1570401647426930469.png"),
          CardImage("http://cicom.miscursosweb.com.co/public/public/files/images/cicom-logo-cicom-15706619581603196708.png"),
          CardImage("http://cicom.miscursosweb.com.co/public/public/files/images/cicom-fechas-importantes-1570662054360126912.png"),
        ],
      ),
    );
  }

}