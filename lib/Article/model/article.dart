
class ArticleModel{
  /* Mapeo del modelo */
  ArticleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title= json['title'],
//        authors= "Autor 1, autor 2",
        authors= json['authors'],
        description= json['description'],
        file= json['file']

  ;

  /* Definicion de tipos */
  final int id;
  final String title;
  var authors;
  final String description;
  final String file;

  String authorsToString(){
//    String authorString="";
//    print(this.authors[0]);
//    for(var author in this.authors){
//      authorString+=author.name+", ";
//    }
    return "Autor 1, autor 2";
//    return authorString;
  }

}