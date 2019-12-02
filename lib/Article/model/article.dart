class Article{
  String title;
  String authors;
  String description;
  String image;

  Article({this.title,this.authors,this.description,this.image});

  factory Article.fromJson(Map json){
    return Article(
      title: json['title'] as String,
      authors: json['authors'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }
}