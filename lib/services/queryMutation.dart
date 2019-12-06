class QueryMutation{
  String getImagesBanner(){
    return """
      query{
        images{
          id
          name
          image
        }
      }
     """;
  }
}