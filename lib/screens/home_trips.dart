import 'package:cicom/models/last_congress.dart';
import 'package:cicom/services/graphqlConf.dart';
import 'package:cicom/services/queryMutation.dart';
import 'package:cicom/widgets/description_place.dart';
import 'package:cicom/widgets/header_appbar.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeTrips extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _handleState();
  }
}

class _handleState extends State<HomeTrips>{
  GraphQLConfiguration graphQLConfiguration=GraphQLConfiguration();

  @override
  void initState() {
    super.initState();
  }

  Future<List<Map<String, dynamic>>> queryLastCongress() async{
    QueryMutation queryMutation=QueryMutation();
    GraphQLClient _client=graphQLConfiguration.clientToQuery();
    final QueryResult data= await _client.query(QueryOptions(document: queryMutation.getLastCongress()));
    final List<Map<String, dynamic>> lastCongress= data.data['lascongress'].cast<Map<String, dynamic>>();
    return lastCongress;
  }

  Widget _buildPage(List<Map<String, dynamic>> page){
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: page.map<Widget>((Map<String, dynamic> item){
        final LastCongress lastCongress=LastCongress.fromJson(item);
        return DescriptionPlace(lastCongress.name,lastCongress.url,lastCongress.file);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 330.0,
          ),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context,int index){
                return FutureBuilder<List<Map<String, dynamic>>>(
                    future: queryLastCongress(),
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
        ),
        HeaderAppBar(),
      ],
    );
  }

}