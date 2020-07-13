import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/view/components/article_tile.dart';
import 'package:news_feed/view/components/category_chips.dart';
import 'package:news_feed/view/components/search_bar.dart';
import 'package:news_feed/view_models/news_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      // Build時には非同期処理
      Future(() => viewModel.getNews(searchType: SearchType.CATEGORY, category: categories[0]));
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新",
          onPressed: () => _onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // 検索バー
              SearchBar(
                onSearch: (keyword) => _getKeywordNews(context, keyword), // CallBack関数をSearchBarに渡してる！
              ),
              // カテゴリータグ
              CategoryChips(
                onCategoryChanged: (category) => _getCategoryNews(context, category),
              ),
              // 記事表示
              Expanded(
                  child: Consumer<NewsListViewModel>(
                    builder: (context, model, child) {
                      return model.isLoading // ConsumerのおかげでisLoadingの値を常に監視できる！！！この部分だけ描画！！！
                          ? Center(child: CircularProgressIndicator(),)
                          : ListView.builder(
                              itemCount: model.articles.length,
                              itemBuilder: (context, int index) => ArticleTile(
                                article: model.articles[index],
                                onClickedArticle: (article) => _openArticleWebPage(article, context),
                              )
                            );
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 記事更新処理
  Future<void> _onRefresh(BuildContext context) async {
    print("_onRefreshよばれあたぜ");
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false); // 呼び出すだけで再描画なし
    // すでにviewModelが持っているプロパティ値でgetNews
    await viewModel.getNews(
      searchType: viewModel.searchType,
      keyword: viewModel.keyword,
      category: viewModel.category
    );
  }

  // キーワードから記事取得処理
  Future<void> _getKeywordNews(BuildContext context, String keyword) async {
    print("_getKeywordNewsよばれたぜ");
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false); // 呼び出すだけで再描画なし
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyword: keyword,
      category: categories[0]
    ); // 総合カテゴリ
  }

  // カテゴリーから記事取得処理
  Future<void> _getCategoryNews(BuildContext context, Category category) async {
    print("_getCategoryNewsやおばれたぜ, ${category.nameJp}");
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false); // 呼び出すだけで再描画なし
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category
    );
  }

  _openArticleWebPage(article, BuildContext context) {
    print("よばれた");
  }
}
