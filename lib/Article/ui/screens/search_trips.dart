import 'package:cicom/Article/ui/screens/article_list_trips.dart';
import 'package:cicom/widgets/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
   DateTime date=DateTime.now();
//   String dateSelect=DateFormat('yyyy-MM-dd').format(date);
}

class _SearchTrips extends State<SearchTrips>{
  final GlobalKey<FormState> _fromKey= GlobalKey<FormState>();
  _SearchData _data=_SearchData();

  List<DropdownMenuItem<String>> _filtersList=<String>['Título','Categoría','Línea de Investigación','Autor'].map<DropdownMenuItem<String>>((String value){
    return DropdownMenuItem<String>(value: value,child: Text(value),);}).toList();

  List<DropdownMenuItem<String>> _valuesList=['value 1','value 2','value 3','value 4','value 5','value 6','value 7','value 8',].map<DropdownMenuItem<String>>((String value){
    return DropdownMenuItem<String>(value: value,child: Text(value),);}).toList();

  Future<Null> _selectDate(BuildContext context) async{
    final DateTime picker= await showDatePicker(
        context: context,
//        locale: Locale.fromSubtags(languageCode: 'es'),
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
    _data.filter2=_data.filter1=_filtersList.first.value;
    _data.value2=_data.value1=_valuesList.first.value;
    super.initState();
  }

  String _validateDate(DateTime value){
    if(value.toString().isEmpty){
      return "La Fecha de Publicación no puede estar vació";
    }
  }

  submit(){
    if(this._fromKey.currentState.validate()){
      this._fromKey.currentState.save();

      print('Printing the login data.');
      print('Filtro1: ${_data.filter1}');
      print('Valor 1: ${_data.value1}');
      print('Filtro2: ${_data.filter2}');
      print('Valor 2: ${_data.value2}');
      print('Fecha: ${_data.date}');

      Route route = MaterialPageRoute(builder: (context) => ArticleListTrips());
      Navigator.of(context).push(route);
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