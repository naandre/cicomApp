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
  List<DropdownMenuItem<String>> _filtersList=<String>['Filtro 1','Filtro 2','Filtro 3','Filtro 4','Filtro 5','Filtro 6','Filtro 7'].map<DropdownMenuItem<String>>((String value){
    return DropdownMenuItem<String>(value: value,child: Text(value),);}).toList();

  List<DropdownMenuItem<String>> _valuesList=['value 1','value 2','value 3','value 4','value 5','value 6','value 7','value 8',].map<DropdownMenuItem<String>>((String value){
    return DropdownMenuItem<String>(value: value,child: Text(value),);}).toList();

  _SearchData _data=_SearchData();

  @override
  void initState(){
    _data.filter2=_data.filter1=_filtersList.first.value;
    _data.value2=_data.value1=_valuesList.first.value;
    super.initState();
  }

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
                DropdownButton<String>(
                  value: _data.filter1,
                  icon: Icon(Icons.arrow_drop_down_circle,color: Colors.blue),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: Colors.blueAccent
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.indigo,
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      _data.filter1=newValue;
                    });
                  },
                  items: this._filtersList,
                ),
                DropdownButton<String>(
                  value: _data.value1,
                  icon: Icon(Icons.arrow_drop_down_circle,color: Colors.blue,),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: Colors.blueAccent
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.indigo,
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      _data.value1=newValue;
                    });
                  },
                  items: this._valuesList,
                ),
                DropdownButton<String>(
                  value: _data.filter2,
                  icon: Icon(Icons.arrow_drop_down_circle,color: Colors.blue),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                      color: Colors.blueAccent
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.indigo,
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      _data.filter2=newValue;
                    });
                  },
                  items: this._filtersList,
                ),
                DropdownButton<String>(
                  value: _data.value2,
                  icon: Icon(Icons.arrow_drop_down_circle,color: Colors.blue,),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                      color: Colors.blueAccent
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.indigo,
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      _data.value2=newValue;
                    });
                  },
                  items: this._valuesList,
                ),
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