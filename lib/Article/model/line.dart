class Line{
  /* Mapeo del modelo */
  Line.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name= json['name'],
        state= json['state']
  ;

  /* Definicion de tipos */
  final int id;
  final String name;
  final int state;
}