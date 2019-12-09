
import 'package:cicom/Article/model/authors.dart';

class ArticleModel{
  /* Mapeo del modelo */
  ArticleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title= json['title'],
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
    String authorString="";
    for(var author in this.authors){
      print("cargando autor ...");
      final Author authorModel=Author.fromJson(author);
      authorString+=authorModel.name+", ";
    }
    print(authorString);
//    return "Autor 1, autor 2";
    return authorString;
  }

}