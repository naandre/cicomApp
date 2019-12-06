class LastCongress{
  /* Mapeo del modelo */
  LastCongress.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        url = json['url'],
        file = json['file']

  ;

  /* Definicion de tipos */
  final int id;
  final String name;
  final String url;
  final String file;
}