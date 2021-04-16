import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLConfiguration {

  static HttpLink httpLink = HttpLink(
    uri: "https://rita.udistrital.edu.co/cicom/public/graphql",
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token;
  }

  GraphQLClient clientToQuery() {
    final token = getToken();

    final AuthLink _authLink = AuthLink(
      getToken: () => 'Bearer $token',
    );

    if(token != null){
      final Link _link = _authLink.concat(httpLink);
    }

    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}
