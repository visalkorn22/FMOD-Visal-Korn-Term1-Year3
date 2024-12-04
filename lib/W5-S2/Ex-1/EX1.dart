import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Label("Method 1: Loop in Array",
                bold:
                    true), //for loop: it is easy to understand  and simple lists but it can get messy if the list grows os has complx
            // TODO
            Column(
              children: [
                for (var color in colors)
                  Label(
                      color), // use for in loop to display the data in array list
              ],
            ),

            Label("Method 2: Map",
                bold:
                    true), //map : it is short and clear code but it might be tricky for somecase expecially with more complex
            // TODO
            Column(
              children: [
                ...colors
                    .map((item) => Label(item))
                    .toList(), // use ... to take each item from the list and adds it seperately//// It lets us insert each `Text` widget directly into the Column.
              ],
            ),
            Label("Method 23: Dedicated Function",
                bold:
                    true), //dedicate ; it is keeping code neat and easy to update with the complex logic but it take a bit long code to set up
            // TODO

            Column(
              children: [
                ...getLabels(),
                ...getLabels(),
              ],
            )
          ],
        ),
      ),
    ),
  ));
}

List<Widget> getLabels() {
  return colors.map((item) => Label(item)).toList();
}

//use for dublicate label
class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
