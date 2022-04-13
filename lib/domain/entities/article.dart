class Article {
  Source? source;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

class Source {
  String? name;

  Source({
    this.name,
  });
}
