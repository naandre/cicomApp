import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DescriptionPlace extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final decriptionText='''
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    ''';
    final description=Container(
      margin: EdgeInsets.only(
        top: 350.0,
        left: 25.0,
        right: 10.0
      ),
      child: Text(
        decriptionText,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900
        ),
        textAlign: TextAlign.center,
      ),
    );
    final title=Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            "Cicom",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.center,
          ),

        ),
      ],
    );
    return title;
  }

}