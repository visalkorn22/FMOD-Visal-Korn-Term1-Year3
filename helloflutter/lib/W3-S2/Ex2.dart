// Start from the exercice 3 code

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyContainer(),
  ));
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1st container
          CustomCard(
            text: 'OOP',
            color: Colors.blue[100],
          ),
          // 2nd container
          CustomCard(
            text: 'DART',
            color: Colors.blue[300],
          ),
          // 3rd container
          CustomCard(
            text: 'FLUTTER',
            color: Colors.blue[600],
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color; //color is optional
  const CustomCard({
    super.key,
    this.text = 'hello',
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: color ?? Colors.blue[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
