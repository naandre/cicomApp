class Author{
  /* Mapeo del modelo */
  Author.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name= json['name']

  ;

  /* Definicion de tipos */
  final int id;
  final String name;
}