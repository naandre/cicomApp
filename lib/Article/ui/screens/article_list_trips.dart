import 'package:cicom/Article/ui/widgets/article_list.dart';
import 'package:cicom/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ArticleListTrips extends StatelessWidget{

  String filter1;
  var value1;
  String filter2;
  var value2;
  String publication;

  ArticleListTrips({this.filter1,this.value1,this.filter2,this.value2,this.publication});

 @override
  Widget build(BuildContext context) {
   print("value2: ${this.value2}");
    return Stack(
      children: <Widget>[
        GradientBack("Artículos", 100),
        Container(
          margin: EdgeInsets.only(top: 70),
          height: 20,
          width: 80,
          child: RaisedButton(
            child: Center(
              child: Text(
                'Nuevo filtro',
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Roboto",
                    color: Colors.white
                ),
              ),
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
            color: Colors.indigo,
          ),
        ),
        ArticleList(filter1: this.filter1,value1: this.value1,filter2: this.filter2,value2: this.value2,publication:this.publication),
      ],
    );
  }

}