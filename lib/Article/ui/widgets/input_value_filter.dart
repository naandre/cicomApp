import 'package:cicom/Article/model/category.dart';
import 'package:cicom/Article/model/line.dart';
import 'package:cicom/services/graphqlConf.dart';
import 'package:cicom/services/queryMutation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class InputValueFilter extends StatefulWidget{
  int filterNumber;
  var viewText;

  InputValueFilter(this.filterNumber,this.viewText);

  @override
  State<StatefulWidget> createState() {
    return _handelState();
  }

}

class _handelState extends State<InputValueFilter>{
  GraphQLConfiguration graphQLConfiguration=GraphQLConfiguration();
  QueryMutation queryMutation=QueryMutation();

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




  @override
  Widget build(BuildContext context) {
    return null;
  }

}