import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlProviderClass {

  //static HttpLink httpLink = HttpLink("https://graphqlzero.almansi.me/api",);

  //static HttpLink httpLink = HttpLink("http://47.254.245.160:443/graphql");

  static HttpLink httpLink = HttpLink("https://3c28-117-97-173-7.in.ngrok.io/graphql");

  static Link linked = httpLink;

  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: linked,
      cache: GraphQLCache(
        //store: HiveStore(),
      ),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: linked,
      cache: GraphQLCache(
        //store: HiveStore(),
      ),
    );
  }
}
