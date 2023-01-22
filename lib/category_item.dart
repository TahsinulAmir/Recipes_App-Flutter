import 'package:flutter/material.dart';
import 'package:recipes_app/recipe.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String images;

  const CategoryItem(
      {super.key, required this.id, required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/recipes',
          arguments: {
            'id': id,
            'title': title,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(64, 0, 0, 0),
                blurRadius: 8,
                offset: Offset(0, 5))
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(images),
            alignment: Alignment.center,
          ),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.1, 0.6],
            ),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
