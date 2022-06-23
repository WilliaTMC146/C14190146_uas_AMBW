class News {
  String title;
  String pubDate;
  String description;
  String thumbnail;
  String link;

  News(
      {required this.title,
      required this.pubDate,
      required this.description,
      required this.thumbnail,
      required this.link});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'],
        pubDate: json['avatar'],
        description: json['nama'],
        thumbnail: json['alamat'],
        link: json['email']);
  }
}
