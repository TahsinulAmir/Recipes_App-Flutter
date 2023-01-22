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
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: filteredFood.length,
            itemBuilder: (context, index) {
              final food = filteredFood[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail_food', arguments: {
                    'title': food.title,
                    'ingredients': food.ingredients,
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(food.imageUrl),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      ' ${food.duration} mins',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.redAccent,
                                    size: 30,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
