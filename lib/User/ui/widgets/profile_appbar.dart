import 'package:cicom/Article/ui/widgets/article_list.dart';
import 'package:cicom/Article/ui/screens/new_trips.dart';
import 'package:cicom/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack("Mi Perfil", 200),
        InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.only(top: 160.0, left: 20, right: 20.0),
            height: 20.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.blue,
                    ],
                    begin: FractionalOffset(0.9, 0.0),
                    end: FractionalOffset(1.0, 0.6),
                    stops: [0.0, 0.8],
                    tileMode: TileMode.clamp)),
            child: Center(
              child: Text(
                "Salir",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Roboto",
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Route route = MaterialPageRoute(builder: (context) => NewTrips());
            Navigator.of(context).push(route);
          },
          child: Container(
            margin: EdgeInsets.only(top: 160.0, left: 110, right: 20.0),
            height: 20.0,
            width: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.blue,
                    ],
                    begin: FractionalOffset(0.9, 0.0),
                    end: FractionalOffset(1.0, 0.6),
                    stops: [0.0, 0.8],
                    tileMode: TileMode.clamp)),
            child: Center(
              child: Text(
                "Cargar Archivo",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Roboto",
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 125
          ),
          child: ArticleList(),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 210,
              left: 20
          ),
          child: Text(
              "Mis últimos artículos subidos",
              style: TextStyle(
                fontSize: 21,
                fontFamily: "Roboto",
                backgroundColor: Colors.white
              ),
          ),
        )
      ],
    );
  }

}