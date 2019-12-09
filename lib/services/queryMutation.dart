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

  // ignore: avoid_init_to_null
  String getArticles({filter1=null,value1=null,filter2=null,value2=null,publication=null}){
    String filter='';

    if(filter1 && value1) filter+='$filter1:$value1,';
    if(filter2 && value2) filter+='$filter2:$value2,';
    if(publication) filter+='publication_date:$publication,';

    if(filter.length>0) filter="($filter)";
    return """
      query{
        articleFilter$filter{
          id
          title
          description
          file
          authors {
            id
            name
          }
        }
      }
     """;
  }

}