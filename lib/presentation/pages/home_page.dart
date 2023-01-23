import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_consume_api_app/data/models/article_model.dart';
import 'package:simple_consume_api_app/presentation/pages/detail_page.dart';
import 'package:simple_consume_api_app/presentation/providers/article_notifier.dart';
import 'package:simple_consume_api_app/utilities/request_state.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business News'),
      ),
      body: SafeArea(
        child: Consumer<ArticleNotifier>(
          builder: (context, state, _) {
            if (state.state == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.state == RequestState.success) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: state.articles.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemBuilder: (context, index) {
                  return _articlTile(
                    context,
                    state.articles[index],
                  );
                },
              );
            } else {
              return Center(
                child: Text(state.message),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _articlTile(BuildContext context, ArticleModel article) {
    return ListTile(
      onTap: () => Navigator.pushNamed(
        context,
        DetailPage.routeName,
        arguments: article,
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          width: 100,
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
      ),
      title: Text(
        article.title,
        overflow: TextOverflow.clip,
        maxLines: 2,
      ),
      subtitle: Text(
        article.author ?? '',
        overflow: TextOverflow.clip,
      ),
    );
  }
}
