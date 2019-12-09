import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class Article extends StatelessWidget{

  String pathImage ="assets/img/article.png";
  String title;
  String authors;
  String descriptions;
  String file;

  Article(this.title,this.authors,this.descriptions,this.file);

  @override
  Widget build(BuildContext context) {
    final titleArticle=Container(
      margin: EdgeInsets.only(
        left: 10.0,
        right: 30
      ),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: "Roboto"
        ),
        softWrap: true,
      ),
    );

    final authorArticle=Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),
      child: Text(
        authors,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 13.0,
          fontFamily: "Roboto",
          color: Color(0xFFA3A5A7)
        ),
      ),
    );

    final descriptionArticle=Container(
      margin: EdgeInsets.only(
        top: 8,
        left: 30.0,
        right: 20.0
      ),
      child: Text(
        descriptions,
        style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 13.0,
            fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.justify,
      ),
    );


    final image=Container(
      margin: EdgeInsets.only(
        top: 30.0,
        left: 20.0
      ),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: AssetImage(pathImage)
        )
      ),
    );

    final articleDetail=Row(
      children: <Widget>[
        image,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleArticle,
            authorArticle
          ],
        )
      ],
    );

    return InkWell(
      onTap: (){launch("http://cicom.miscursosweb.com.co/public/public/files/articles/${this.file}");},
      child: Column(
        children: <Widget>[
          articleDetail,
          descriptionArticle,
          Text(
            "Abrir",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13.0,
                fontFamily: "Roboto",
                color: Colors.blue
            ),
          )
        ],
      ),
    );
  }

}