import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/models/repository/news_repository.dart';

// ChangeNotifierを継承して、ModelからView(ChangeNotifierProvider)に状態変化を伝える！
class NewsListViewModel extends ChangeNotifier {

  final NewsRepository _repository = NewsRepository();

  // ここのプロパティ値を、ListenしているWidgetが監視する
  // 検索の方法
  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType; // カプセル化(getter定義)。_searchTypeに対して外からgetだけできるようにした

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";
  String get keyword => _keyword;

  // ローディング中かどうか
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // 結果の配列
  List<Article> _articles = List();
  List<Article> get articles => _articles;


  // Viewから呼ばれる
  Future<void> getNews({@required SearchType searchType, String keyword, Category category}) async {
    print("[ViewModel]searchType: $searchType, keyword: $keyword, category: ${category.nameJp}");

    _searchType = searchType;
    _keyword = keyword;
    _category = category;
    _isLoading = true;
    notifyListeners(); // ChangeNotifierProviderに変更通知

    // Repositoryを呼び出す
    _articles = await _repository.getNews(searchType: _searchType, keyword: _keyword, category: _category);
    print("searchType: $_searchType / keyword: $keyword / category: $category / articles: ${_articles[0].title}");
    _isLoading = false;
    notifyListeners(); // ChangeNotifierProviderに変更通知
    // 戻り値としてarticlesを返すのではなく、自動通知する！
  }

  // インスタンスが破棄されるとき呼ばれる
  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }
}
