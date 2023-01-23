import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_consume_api_app/data/models/article_model.dart';
import 'package:simple_consume_api_app/presentation/pages/detail_page.dart';
import 'package:simple_consume_api_app/presentation/pages/empty_page.dart';
import 'package:simple_consume_api_app/presentation/pages/home_page.dart';
import 'package:simple_consume_api_app/presentation/providers/article_notifier.dart';

import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleNotifier>(
      create: (_) => di.locator(),
      builder: (context, _) => MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(
                builder: (_) => const HomePage(),
              );
            case DetailPage.routeName:
              return MaterialPageRoute(
                builder: (_) => DetailPage(
                  article: settings.arguments as ArticleModel,
                ),
              );
            default:
              return MaterialPageRoute(
                builder: (_) => const EmptyPage(),
              );
          }
        },
      ),
    );
  }
}
