import 'package:flutter/material.dart';

void main() => runApp(MyWidget());

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isSelected = false;
  String get bText => isSelected ? "Selected" : "Not Selected";
  Color get backgroundColor =>
      isSelected ? Colors.blue[500]! : Colors.blue[50]!;
  Color get textColor => isSelected ? Colors.white : Colors.black;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            height: 100,
            child: ElevatedButton(
                onPressed: () => {
                      setState(() {
                        isSelected = !isSelected;
                      })
                    },
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                ),
                child: Center(
                  child: Text(
                    bText,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
