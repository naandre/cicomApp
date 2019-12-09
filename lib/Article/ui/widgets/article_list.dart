import 'package:cicom/Article/model/article.dart';
import 'package:cicom/services/graphqlConf.dart';
import 'package:cicom/services/queryMutation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'article.dart';

class ArticleList extends StatefulWidget{
  String filter1;
  String value1;
  String filter2;
  String value2;

  ArticleList({this.filter1,this.value1,this.filter2,this.value2});

  @override
  State<StatefulWidget> createState() {
    return _handleState(filter1: this.filter1,value1: this.value1,filter2: this.value2);
  }
}

class _handleState extends State<ArticleList>{

  String filter1;
  String value1;
  String filter2;
  String value2;

  _handleState({this.filter1,this.value1,this.filter2,this.value2});

  GraphQLConfiguration graphQLConfiguration=GraphQLConfiguration();

  @override
  void initState() {
    super.initState();
  }

  Future<List<Map<String, dynamic>>> queryArticles() async{
    QueryMutation queryMutation=QueryMutation();
    GraphQLClient _client=graphQLConfiguration.clientToQuery();
    final QueryResult data= await _client.query(QueryOptions(document: queryMutation.getArticles(filter1: this.filter1,value1: this.value1,filter2: this.filter2,value2: this.value2)));
    final List<Map<String, dynamic>> articles= data.data['articleFilter'].cast<Map<String, dynamic>>();
    return articles;
  }

  Widget _buildPage(List<Map<String, dynamic>> page){
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: page.map<Widget>((Map<String, dynamic> item){
        final ArticleModel articleModel=ArticleModel.fromJson(item);
        return Article(articleModel.title,articleModel.authorsToString(),articleModel.description,articleModel.file);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 100
      ),
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context,int index){
            return FutureBuilder<List<Map<String, dynamic>>>(
                future: queryArticles(),
                builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height*2,
                      child: Container(margin: EdgeInsets.only(top: 300),child: const Align(alignment: Alignment.topCenter, child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent,))),
                    );
                  }
                  if(snapshot.hasError){
                    return Center(child: Text('Error : ${snapshot.error}'));
                  }else{
                    return _buildPage(snapshot.data);
                  }
                }
            );
          }),
    );
  }

}