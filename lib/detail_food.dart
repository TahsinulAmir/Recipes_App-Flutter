import 'package:flutter/material.dart';

class DetailFood extends StatelessWidget {
  const DetailFood({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsFood =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<String> ingredients = argsFood['ingredients'];
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Column(
          children: [
            Text(argsFood['title'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text('${ingredients.length} items'),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  final ing = ingredients[index];
                  return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(ing),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
