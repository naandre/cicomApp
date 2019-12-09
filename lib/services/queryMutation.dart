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
  String getArticles({filter1,value1,filter2,value2,publication}){
    String filter='';
    var dateNow=DateTime.now();
    String dateNowString="${dateNow.year}-${dateNow.month}-${dateNow.day}";

    print(filter1);
    print(value1);
    print(filter2);
    print(value2);
    print(publication);
    print(filter1!=null && value1!=null);
    if(filter1!=null && value1!=null) filter+='$filter1:$value1,';
    if(filter2!=null && value2!=null) filter+='$filter2:$value2,';
    if(publication!=null && dateNowString!=publication) filter+='publication_date:"$publication"';

    if(filter.length>0) filter="($filter)";
    print(filter);
    var query= """
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
    print(query);
    return query;
  }

}