import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionPlace extends StatelessWidget{

  String namePlace;
  String url;
  String file;

  DescriptionPlace(this.namePlace,this.url,this.file);


  @override
  Widget build(BuildContext context) {

    final title=Container(
          margin: EdgeInsets.only(
            top: 10.0,
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
        );

    final description=Container(
      margin: EdgeInsets.only(
          top: 5.0,
          left: 10,
          right: 5
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Abrir url: ${this.url.toString()}",
              style: new TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              ),
              recognizer: TapGestureRecognizer()
                ..onTap=(){launch(this.url);}
            ),
            TextSpan(text:"""
            
            
___________________________________________________________________
            
""",
              style: new TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),),
            TextSpan(
              text: "Abrir archivos: ${this.file.toString()}",
              style: new TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              ),
              recognizer: TapGestureRecognizer()
                ..onTap=(){launch("https://rita.udistrital.edu.co/cicom/public/public/files/lastcongress/${this.file}");}
            ),
          ]
        ),
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