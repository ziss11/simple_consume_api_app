import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:simple_consume_api_app/data/datasources/article_remote_datasource.dart';
import 'package:simple_consume_api_app/presentation/providers/article_notifier.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory<ArticleNotifier>(() => ArticleNotifier(locator()));

  // datasource
  locator.registerLazySingleton<ArticleRemoteDataSource>(
    () => ArticleRemoteDataSource(locator()),
  );

  // external
  locator.registerLazySingleton<http.Client>(() => http.Client());
}
