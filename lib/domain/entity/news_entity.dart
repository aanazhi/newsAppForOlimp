class NewsEntity {
  final String? author;
  final String title;
  final String description;
  final String? urlToImage;
  final String content;

  NewsEntity({
    this.author,
    required this.title,
    required this.description,
    this.urlToImage,
    required this.content,
  });
}
