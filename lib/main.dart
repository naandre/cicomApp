//import 'package:cicom/User/bloc/bloc_user.dart';
import 'package:cicom/services/graphqlConf.dart';
import 'package:cicom/widgets/menu_trips_cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application. #0073a1
  @override
  Widget build(BuildContext context) {

    GraphQLConfiguration graphQLConfiguration=GraphQLConfiguration();

    return GraphQLProvider(
      client: graphQLConfiguration.client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cicom App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MenuTripsCupertino(),
      ),
    );

    /*return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        title: 'Cicom App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MenuTripsCupertino(),
      ),
    );*/

  }
}