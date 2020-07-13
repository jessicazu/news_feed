import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view/components/article_tile_desc.dart';
import 'package:news_feed/view/components/image_form_url.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final ValueChanged onClickedArticle; // URLを引数で渡すためValueChanged型

  ArticleTile({this.article, this.onClickedArticle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell( // クリック感出す
          onTap: () => onClickedArticle(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,  // 1:3の割合で配置
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ImageFromUrl(
                    imageUrl: article.urlToImage,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ArticleTileDesc(article: article,)
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
