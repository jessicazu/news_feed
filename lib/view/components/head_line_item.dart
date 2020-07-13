import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view/components/image_form_url.dart';
import 'package:news_feed/view/components/lazy_load_text.dart';
import 'package:news_feed/view/components/page_transformer.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onClickedArticle;

  HeadLineItem({this.article, this.pageVisibility, this.onClickedArticle});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => onClickedArticle(article),
        child: Stack(
          fit: StackFit.expand, // 親のサイズに合わせる
          children: <Widget>[
            DecoratedBox(
              position: DecorationPosition.foreground, // デコるのがchildが描画される前か後か
              decoration: BoxDecoration(
                gradient: LinearGradient( // グラデーション
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black87,
                    Colors.black26,
                  ]
                )
              ),
              child: ImageFromUrl(
                imageUrl: article.urlToImage,
              ),
            ),
            Positioned(
              // 自由に配置
              bottom: 56,
              left: 32,
              right: 32,
              child: LazyLoadText(
                text: article.title,
                pageVisibility: pageVisibility,
              )
            )
          ],
        ),
      ),
    );
  }
}
