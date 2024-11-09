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
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'OOP',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          // 2nd container
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'DART',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          // 3rd container
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[300]!, Colors.blue[900]!],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'FLUTTER',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
