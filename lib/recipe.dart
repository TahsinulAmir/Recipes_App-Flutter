import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  final String idCategory;
  final String title;
  const Recipe({super.key, required this.idCategory, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Text("Recipes"),
      ),
    );
  }
}
