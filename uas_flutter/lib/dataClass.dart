class News {
  String title;
  String pubDate;
  String description;
  String thumbnail;
  String link;
  String image;

  News(
      {required this.title,
      required this.pubDate,
      required this.description,
      required this.thumbnail,
      required this.link,
      required this.image});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      pubDate: json['pubDate'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      link: json['link'],
      image: json['image'],
    );
  }
}
