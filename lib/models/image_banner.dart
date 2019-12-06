class ImageBanner{
  /* Mapeo del modelo */
  ImageBanner.fromJson(Map<String, dynamic> json)
        : id = json['id'],
          name = json['name'],
          image = json['image']

  ;

  /* Definicion de tipos */
  final int id;
  final String name;
  final String image;
}