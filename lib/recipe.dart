import 'package:flutter/material.dart';
import 'package:recipes_app/dummy_data.dart';

import 'models/food.dart';

class Recipe extends StatelessWidget {
  // final String idCategory;
  // final String title;
  const Recipe({
    super.key,
    // required this.idCategory,
    // required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsRecipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<Food> filteredFood = dummy_food.where((food) {
      return food.category.contains(argsRecipe['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          argsRecipe['title'],
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: filteredFood.length,
          itemBuilder: (context, index) {
            final food = filteredFood[index].title;
            return Text(food);
          },
        ),
      ),
    );
  }
}
