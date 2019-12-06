import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DescriptionPlace extends StatelessWidget{

  String namePlace;
  String url;
  String file;

  DescriptionPlace(this.namePlace,this.url,this.file);

  @override
  Widget build(BuildContext context) {

    final title=Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 10.0,
            left: 30
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
          top: 5.0,
      ),
      child: Text(
        """
          url: ${this.url.toString()} 
          archivos: ${this.url.toString()} 
        """,
        style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),
        textAlign: TextAlign.left,
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