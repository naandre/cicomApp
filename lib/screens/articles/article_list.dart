import 'package:cicom/screens/gradient_back.dart';
import 'package:flutter/material.dart';
import 'article.dart';

class ArticleList extends StatelessWidget{
  String description='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.';
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        GradientBack("Artículos", 100),
        Container(
          margin: EdgeInsets.only(
              top: 100
          ),
          child: ListView(
            children: <Widget>[
              Article("article 1", "Autor 1, autor 2", description),
              Article("article 2", "Autor 13, autor 22", description),
              Article("article 3", "Autor 7, autor 2", description),
              Article("article 4", "Autor 1, autor 5", description),
              Article("article 5", "Autor 3, autor 6", description),
              Article("article 6", "Autor 4, autor 8", description),
              Article("article 7", "Autor 20, autor 18", description),
              Article("article 8", "Autor 30, autor 17", description),
              Article("article 9", "Autor 4, autor 5", description),
              Article("article 10", "Autor 9, autor 8", description),
            ],
          ),
        ),
      ],
    );
  }

}