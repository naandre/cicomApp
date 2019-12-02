import 'package:cicom/Article/ui/screens/article_list_trips.dart';
import 'package:cicom/widgets/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTrips extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NewTrips();
  }
}

class _newTripsData{
   String title='';
   String description='';
   String category='';
   String line='';
   String editorial='';
   DateTime date=DateTime.now();
}

class _NewTrips extends State<NewTrips>{
  final GlobalKey<FormState> _fromKey= GlobalKey<FormState>();
  _newTripsData _data=_newTripsData();

  List<DropdownMenuItem<String>> _categoriesList=<String>['Categoria 1','Categoria 2','Categoria 3','Categoria 4','Categoria 5','Categoria 6','Categoria 7'].map<DropdownMenuItem<String>>((String value){
    return DropdownMenuItem<String>(value: value,child: Text(value),);}).toList();

  List<DropdownMenuItem<String>> _lineList=['Linea 1','Linea 2','Linea 3','Linea 4','Linea 5','Linea 6','Linea 7','Linea 8',].map<DropdownMenuItem<String>>((String value){
    return DropdownMenuItem<String>(value: value,child: Text(value),);}).toList();

  Future<Null> _selectDate(BuildContext context) async{
    final DateTime picker= await showDatePicker(
        context: context,
        initialDate: this._data.date,
        firstDate: DateTime(1990),
        lastDate: DateTime.now());

    if(picker!=null && picker!=this._data.date){
      setState(() {
        this._data.date=picker;
      });
    }
  }

  @override
  void initState(){
    _data.category=_categoriesList.first.value;
    _data.line=_lineList.first.value;
    super.initState();
  }

  String _validateTitle(String value){
    if(value.isEmpty){
      return "El título no puede estar vacío";
    }
  }
  String _validateDescription(String value){
    if(value.isEmpty){
      return "La descripcion no puede estar vacía";
    }
  }
  String _validateEditorial(String value){
    if(value.isEmpty){
      return "La editorial no puede estar vacía";
    }
  }
  String _validateDate(DateTime value){
    if(value.toString().isEmpty){
      return "La Fecha de Publicación no puede estar vació";
    }
  }

  submit(){
    if(this._fromKey.currentState.validate()){
      this._fromKey.currentState.save();

      print('Data: ${_data.date}');

      Route route = MaterialPageRoute(builder: (context) => ArticleListTrips());
      Navigator.of(context).push(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack('Buscar articulo', 100),
        InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.only(top: 70.0, left: 10, right: 20.0),
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
                "Cancelar",
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
              top: 120,
              left:20,
              right: 20
          ),
          child: Form(
            key: this._fromKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Título',
                    labelText: 'Título'
                  ),
                  validator: _validateTitle,
                  onSaved: (String value){
                    this._data.title=value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Descripción',
                    labelText: 'Descripción',
                  ),
                  validator: _validateDescription,
                  onSaved: (String value){
                    this._data.description=value;
                  },
                ),
                DropdownButton<String>(
                  value: _data.category,
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
                      _data.category=newValue;
                    });
                  },
                  items: this._categoriesList
                ),
                DropdownButton<String>(
                  value: _data.line,
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
                      _data.line=newValue;
                    });
                  },
                  items: this._lineList,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Editorial',
                      labelText: 'Editorial'
                  ),
                  validator: _validateEditorial,
                  onSaved: (String value){
                    this._data.editorial=value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: DateFormat('yyyy-MM-dd').format(this._data.date),
                    hintText: "Fecha de Publicación",
                    icon: Icon(Icons.calendar_today,color: Colors.blue,),
                  ),
                  onTap: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                    _selectDate(context);
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0, left: 20, right: 20.0),
                  height: 50.0,
                  width: 180.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF0288D1),
                            Color(0xFF01579B),
                          ],
                          begin: FractionalOffset(0.2, 0.0),
                          end: FractionalOffset(1.0, 0.6),
                          stops: [0.0, 0.6],
                          tileMode: TileMode.clamp)),
                  child: RaisedButton(
                    child: Center(
                      child: Text(
                        'Filtrar',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: "Roboto",
                            color: Colors.white
                        ),
                      ),
                    ),
                    onPressed: this.submit,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

}