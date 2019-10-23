import 'package:cicom/screens/gradient_back.dart';
import 'package:flutter/material.dart';

class SearchTrips extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchTrips();
  }
}

class _SearchData{
   String filter1='';
   String value1='';
   String filter2='';
   String value2='';
   DateTime date;
}

class _SearchTrips extends State<SearchTrips>{
  final GlobalKey<FormState> _fromKey= GlobalKey<FormState>();
  _SearchData _data=_SearchData();

  String _validateDate(DateTime value){
    if(value.toString().isEmpty){
      return "La correo Fecha de Publicación no puede estar vació";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack('Buscar articulo', 100),
        Container(
          margin: EdgeInsets.only(
              top: 120,
              left:20,
              right: 20
          ),
          child: Form(
            key: this._fromKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Fecha de Publicación"
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

}