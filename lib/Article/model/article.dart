class ArticleModel{
  /* Mapeo del modelo */
  ArticleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title= json['title'],
        authors= "Autor 1, autor 2",
//        authors= json['authors'],
        description= json['description'],
        file= json['file']

  ;

  /* Definicion de tipos */
  final int id;
  final String title;
  final String authors;
  final String description;
  final String file;

}