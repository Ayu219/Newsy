
class NewsModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});
  
}
class Source {
  String? id;
  String? name;

  Source({this.id, this.name});
}