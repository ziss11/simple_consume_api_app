import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final String? author;
  final String title;
  final String desc;
  final String url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleModel({
    required this.author,
    required this.title,
    required this.desc,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        author: json['author'],
        title: json['title'],
        desc: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
      );

  @override
  List<Object?> get props => [
        author,
        title,
        desc,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
