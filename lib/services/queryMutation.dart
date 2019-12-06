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

  String getCategories(){
    return """
      query{
        categories{
          id
          name
          state
        }
      }
     """;
  }

  String getLines(){
    return """
      query{
        lines{
          id
          name
          state
        }
      }
     """;
  }

  String getArticles(){
    return """
      query{
        articles{
          id
          title
          description
          file
        }
      }
     """;
  }

}