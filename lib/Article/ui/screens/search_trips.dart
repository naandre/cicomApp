import 'package:cicom/Article/model/category.dart';
import 'package:cicom/Article/model/line.dart';
import 'package:cicom/Article/ui/screens/article_list_trips.dart';
import 'package:cicom/services/graphqlConf.dart';
import 'package:cicom/services/queryMutation.dart';
import 'package:cicom/widgets/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
  var viewTextInput1=false;
  var viewTextInput2=false;
  //coneccion con Graphql
  GraphQLConfiguration graphQLConfiguration=GraphQLConfiguration();
  QueryMutation queryMutation=QueryMutation();
  //key del formulario
  final GlobalKey<FormState> _fromKey= GlobalKey<FormState>();
  _SearchData _data=_SearchData();
  //Filtros
  List<DropdownMenuItem<String>> _filtersList=<String>['Título','Categoría'].map<DropdownMenuItem<String>>((String value){
    return DropdownMenuItem<String>(value: value,child: Text(value),);}).toList();

  List<DropdownMenuItem<String>> _filtersList2=<String>['Línea de Investigación','Autor'].map<DropdownMenuItem<String>>((String value){
    return DropdownMenuItem<String>(value: value,child: Text(value),);}).toList();
  //consultas y generacion de listados de calores para los filtros
  Future<List<Map<String, dynamic>>> queryCategories() async{
    GraphQLClient _client=graphQLConfiguration.clientToQuery();
    final QueryResult data= await _client.query(QueryOptions(document: queryMutation.getCategories()));
    final List<Map<String, dynamic>> categories= data.data['categories'].cast<Map<String, dynamic>>();
    return categories;
  }

  List<DropdownMenuItem<String>> _buildCategoriesMenuItems(List<Map<String, dynamic>> page){
    return page.map<DropdownMenuItem<String>>((Map<String, dynamic> item){
        final Category category=Category.fromJson(item);
        return DropdownMenuItem<String>(
            value: category.id.toString(),
            child: Builder(builder: (BuildContext context) {
              return Text(category.name);
            },)
        );
      }).toList();
  }

  Future<List<Map<String, dynamic>>> queryLines() async{
    GraphQLClient _client=graphQLConfiguration.clientToQuery();
    final QueryResult data= await _client.query(QueryOptions(document: queryMutation.getLines()));
    final List<Map<String, dynamic>> lines= data.data['lines'].cast<Map<String, dynamic>>();
    return lines;
  }

  List<DropdownMenuItem<String>> _buildLinesMenuItems(List<Map<String, dynamic>> page){
    return page.map<DropdownMenuItem<String>>((Map<String, dynamic> item){
      final Line line=Line.fromJson(item);
      return DropdownMenuItem<String>(
          value: line.id.toString(),
          child: Builder(builder: (BuildContext context) {
            return Text(line.name);
          },)
      );
    }).toList();
  }
//Resolucion de campo parafiltro 1
  Widget getInputFilter1(){
    return viewTextInput1 ? TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Título',
          labelText: 'Título'
      ),
      onSaved: (String value){
        _data.value1=value;
      },
    ) : FutureBuilder<List<Map<String, dynamic>>>(
        future: queryLines(),
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return SizedBox(
              height: MediaQuery.of(context).size.height*2,
              child: Container(margin: EdgeInsets.only(top: 5),child: const Align(alignment: Alignment.topCenter, child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent,))),
            );
          }
          if(snapshot.hasError){
            return Center(child: Text('Error : ${snapshot.error}'));
          }else{
            return DropdownButton<String>(
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
              items: _buildLinesMenuItems(snapshot.data),
              hint: Text('Selecciona una opción...'),
            );
          }
        }
    );
  }
//Resolucion de campo parafiltro 2
  Widget getInputFilter2(){
    return viewTextInput2 ? TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Autor',
          labelText: 'Autor'
      ),
      onSaved: (String value){
        _data.value2=value;
      },
    ) : FutureBuilder<List<Map<String, dynamic>>>(
        future: queryCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return SizedBox(
              height: MediaQuery.of(context).size.height*2,
              child: Container(margin: EdgeInsets.only(top: 5),child: const Align(alignment: Alignment.topCenter, child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent,))),
            );
          }
          if(snapshot.hasError){
            return Center(child: Text('Error : ${snapshot.error}'));
          }else{
            return DropdownButton<String>(
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
              items: _buildCategoriesMenuItems(snapshot.data),
              hint: Text('Selecciona una opción...'),
            );
          }
        }
    );
  }

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
    _data.filter2=_data.filter1=null;
    _data.value2=_data.value1=null;
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

      Route route = MaterialPageRoute(builder: (context) => ArticleListTrips(
        filter1: _data.filter1=='Titulo'?'title':'category',
        value1: _data.value1,
        filter2: _data.filter2=='Línea de Investigación'?'line':'author',
        value2: _data.value2,
      ));
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
                      if(newValue=='Título'){
                        viewTextInput1=true;
                      }else{
                        viewTextInput1=false;
                      }
                      _data.filter1=newValue;
                    });
                  },
                  items: this._filtersList,
                  hint: Text('Selecciona un tipo de filtro...'),
                ),
                getInputFilter1(),
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
                      if(newValue=='Autor'){
                        viewTextInput2=true;
                      }else{
                        viewTextInput2=false;
                      }
                      _data.filter2=newValue;
                    });
                  },
                  items: this._filtersList2,
                  hint: Text('Selecciona un tipo de filtro...'),
                ),
                getInputFilter2(),
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