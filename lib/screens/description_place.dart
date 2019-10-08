import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DescriptionPlace extends StatelessWidget{

  String namePlace;
  String descriptionPlace;

  DescriptionPlace(this.namePlace,this.descriptionPlace);

  @override
  Widget build(BuildContext context) {

    final title=Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            namePlace,
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.center,
          ),

        )
      ],
    );

    final description=Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0
      ),
      child: Text(
        this.descriptionPlace,
        style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),
        textAlign: TextAlign.center,
      ),
    );

    return Column(
      children: <Widget>[
        title,
        description
      ],
    );
  }

}