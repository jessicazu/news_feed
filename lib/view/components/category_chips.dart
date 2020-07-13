import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';

class CategoryChips extends StatefulWidget {
  final ValueChanged onCategoryChanged;
  CategoryChips({this.onCategoryChanged});

  @override
  _CategoryChipsState createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {

  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: List<Widget>.generate(categories.length, (int index) {
        // ChoiceChipのひとつひとつがindexを持っている
        return ChoiceChip(
          label: Text(categories[index].nameJp),
          selected: value == index,
          onSelected: (bool isSelected) {
            setState(() {
              value = isSelected ? index : 0; // クリックされたらvalueを更新する
              widget.onCategoryChanged(categories[index]);
            });
          },
        );
      }).toList()
    );
  }
}
