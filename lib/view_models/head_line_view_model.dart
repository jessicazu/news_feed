import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/models/repository/news_repository.dart';

class HeadLineViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  // ここのプロパティ値を、ListenしているWidgetが監視する
  // 検索の方法
  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType; // カプセル化(getter定義)。_searchTypeに対して外からgetだけできるようにした

  // ローディング中かどうか
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // 結果の配列
  List<Article> _articles = List();
  List<Article> get articles => _articles;


  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }

  Future<void> getHeadLines({@required SearchType searchType}) async {
    _searchType = searchType;
    _isLoading = true;
    notifyListeners(); // ChangeNotifierProviderに変更通知

    _articles = await _repository.getNews(searchType: SearchType.HEAD_LINE);
    print("searchType: $_searchType / articles: ${_articles[0].title}");
    _isLoading = false;
    notifyListeners(); // ChangeNotifierProviderに変更通知
  }

}