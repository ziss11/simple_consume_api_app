import 'package:equatable/equatable.dart';
import 'package:simple_consume_api_app/data/models/article_model.dart';

class ArticleResponse extends Equatable {
  final List<ArticleModel> articleList;

  const ArticleResponse({required this.articleList});

  factory ArticleResponse.fronJson(Map<String, dynamic> json) =>
      ArticleResponse(
        articleList: List<ArticleModel>.from(
          (json['articles'] as List).map((e) => ArticleModel.fromJson(e)).where(
                (article) =>
                    article.author != null &&
                    article.urlToImage != null &&
                    article.publishedAt != null &&
                    article.content != null,
              ),
        ),
      );

  @override
  List<Object?> get props => [articleList];
}
