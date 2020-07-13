import 'package:flutter/material.dart';
import 'package:news_feed/view/components/page_transformer.dart';

class LazyLoadText extends StatelessWidget {
  final String text;
  final PageVisibility pageVisibility;

  LazyLoadText({this.text, this.pageVisibility});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: Alignment.topLeft,
        transform: Matrix4.translationValues(
          pageVisibility.pagePosition * 150,
          0,
          0,
        ),
        child: Text(
          text,
          style: textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
