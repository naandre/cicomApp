import 'package:cicom/Article/ui/widgets/article_list.dart';
import 'package:cicom/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

class ArticleListTrips extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
        ArticleList(),
      ],
    );
  }

}