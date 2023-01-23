import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_consume_api_app/data/models/article_model.dart';

class DetailPage extends StatelessWidget {
  static const routeName = 'detail';

  final ArticleModel article;

  const DetailPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: article.urlToImage ?? '',
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      height: 3,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(article.desc),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      height: 3,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Date: ${article.publishedAt}'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Author: ${article.author}'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      height: 3,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      article.content!,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
