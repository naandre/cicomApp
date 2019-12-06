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

  String getLastCongress(){
    return """
      query{
        lascongress{
          id
          name
          url
          file
        }
      }
     """;
  }

}