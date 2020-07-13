import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  final TextEditingController _textEditingController = TextEditingController();
  final ValueChanged onSearch;

  SearchBar({this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(8))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: TextField(
          // 入力したとき
          onSubmitted: onSearch,
          maxLines: 1,
          controller: _textEditingController,
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "検索ワードを入れてください",
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}
