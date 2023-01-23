import 'package:flutter/cupertino.dart';
import 'package:simple_consume_api_app/data/datasources/article_remote_datasource.dart';
import 'package:simple_consume_api_app/data/models/article_model.dart';
import 'package:simple_consume_api_app/utilities/request_state.dart';

class ArticleNotifier extends ChangeNotifier {
  final ArticleRemoteDataSource _remoteDataSource;

  ArticleNotifier(this._remoteDataSource) {
    _getArticles();
  }

  late List<ArticleModel> _articles;
  List<ArticleModel> get articles => _articles;

  late String _message;
  String get message => _message;

  RequestState _state = RequestState.initial;
  RequestState get state => _state;

  void _getArticles() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await _remoteDataSource.getTopHeadlines();

    try {
      if (result.isNotEmpty) {
        _state = RequestState.success;
        notifyListeners();

        _articles = result;
      } else {
        _state = RequestState.initial;
        notifyListeners();

        _message = 'Empty data';
      }
    } catch (e) {
      _state = RequestState.error;
      notifyListeners();

      _message = e.toString();
    }
  }
}
