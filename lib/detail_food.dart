import 'package:flutter/material.dart';

class DetailFood extends StatelessWidget {
  const DetailFood({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsFood =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Center(
        child: Text(argsFood['title']),
      ),
    );
  }
}
