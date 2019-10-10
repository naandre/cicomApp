import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget{

  String title="Cicom";
  double heightGradient=250;

  GradientBack(this.title,this.heightGradient);
//backgroundImage: NetworkImage(snapshot.data[index].thumbnailUrl),
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightGradient,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0288D1),
            Color(0xFF01579B),
          ],
          begin: FractionalOffset(0.2,0.0),
          end: FractionalOffset(1.0,0.6),
          stops: [0.0,0.6],
          tileMode: TileMode.clamp
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold
          ),
        ),
          alignment: Alignment(-0.9,-0.6),
        ),
    );
  }
}