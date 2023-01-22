import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String images;

  const CategoryItem(
      {super.key, required this.id, required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Text(title),
    );
  }
}
