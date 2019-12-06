import 'package:cicom/models/image_banner.dart';
import 'package:flutter/material.dart';

import 'package:cicom/services/graphqlConf.dart';
import 'package:cicom/services/queryMutation.dart';
import 'package:flutter/painting.dart';
import 'package:cicom/widgets/card_image.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
class CardImageList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _handleState();
  }
}

class _handleState extends State<CardImageList>{
  GraphQLConfiguration graphQLConfiguration=GraphQLConfiguration();
  
  @override
  void initState() {
    super.initState();
  }
  
  Future<List<Map<String, dynamic>>> queryImage() async{
    QueryMutation queryMutation=QueryMutation();
    GraphQLClient _client=graphQLConfiguration.clientToQuery();
    final QueryResult data= await _client.query(QueryOptions(document: queryMutation.getImagesBanner()));
    final List<Map<String, dynamic>> images= data.data['images'].cast<Map<String, dynamic>>();
    return images;
  }

  Widget _buildPage(List<Map<String, dynamic>> page){
    return Container(
      height: 300,
      child: ListView(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: page.map<Widget>((Map<String, dynamic> item){
          final ImageBanner imageBanner=ImageBanner.fromJson(item);
          return CardImage("http://cicom.miscursosweb.com.co/public/public/files/images/${imageBanner.image}");
        }).toList(),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context,int index){
            return FutureBuilder<List<Map<String, dynamic>>>(
                future: queryImage(),
                builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height*2,
                      child: Container(margin: EdgeInsets.only(top: 170),child: const Align(alignment: Alignment.topCenter, child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent,))),
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