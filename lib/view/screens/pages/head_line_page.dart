import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view/components/head_line_item.dart';
import 'package:news_feed/view/components/page_transformer.dart';
import 'package:news_feed/view_models/head_line_view_model.dart';
import 'package:provider/provider.dart';

class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HeadLineViewModel viewModel = Provider.of<HeadLineViewModel>(context, listen: false);

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Consumer<HeadLineViewModel>(
            builder: (context, model, child) {
              return model.isLoading
                ? Center(child: CircularProgressIndicator(),)
                : PageTransformer(
                    pageViewBuilder: (context, pageVisibilityResolver) {
                      return PageView.builder(
                        controller: PageController( // 表示するページのindexのコントローラ。initialPageはデフォルト0
                          viewportFraction: 0.85, // 画面に対してどれくらい幅とるか
                        ),
                        itemCount: model.articles.length,
                        itemBuilder: (context, index) {
                          final Article article = model.articles[index];
                          final pageVisibility = pageVisibilityResolver.resolvePageVisibility(index);
                          final visibleFraction = pageVisibility.visibleFraction;
                          return HeadLineItem(
                            article: model.articles[index],
                            pageVisibility: pageVisibility,
                            onClickedArticle: (article) => _openArticleWebPage(article, context),
                          );
                        }
                      );
                    }
                  );
            }
          ),
        )
      )
    );
  }

  onRefresh(BuildContext context) async {
    final HeadLineViewModel viewModel = Provider.of<HeadLineViewModel>(context, listen: false);
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);
  }

  _openArticleWebPage(Article article, BuildContext context) {
    print("よばれたんやな");
  }
}
