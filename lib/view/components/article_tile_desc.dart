import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/style/style.dart';

class ArticleTileDesc extends StatelessWidget {
  final Article article;
  ArticleTileDesc({this.article});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // styleの詳細: https://material.io/design/typography/#type-scale
        Text(article.title, style: textTheme.subtitle1.copyWith( // copyWithでスタイルを継承しつつ変更
          fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 4,),
        Text(article.publishDate, style: textTheme.overline.copyWith(
          fontStyle: FontStyle.italic
        ),),
        const SizedBox(height: 10,),
        Text(article.description ?? "", style: textTheme.bodyText2.copyWith(
          fontFamily: SerifFont
        ),)
      ],
    );
  }
}
