import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Gradient Button Example")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradiantButton(
                text: "Hello 1",
                start: Colors.blue,
                end: Colors.red,
              ),
              GradiantButton(
                text: "Hello 2",
                start: Colors.green,
                end: Colors.purple,
              ),
              GradiantButton(
                text: "Hello 3",
                start: Colors.orange,
                end: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradiantButton extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;

  GradiantButton({
    required this.text,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shadowColor: Colors.transparent,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: const Color.fromARGB(255, 1, 56, 255)),
        ),
      ),
    );
  }
}
