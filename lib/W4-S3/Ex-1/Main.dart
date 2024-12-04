import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionExample(),
    );
  }
}

class SelectionExample extends StatefulWidget {
  @override
  _SelectionExampleState createState() => _SelectionExampleState();
}

class _SelectionExampleState extends State<SelectionExample> {
  // This boolean variable keeps track of whether the button is selected or not.
  bool isSelected = false;

  // This function is called when the button is pressed.
  // It toggles the "isSelected" variable between true and false.
  void toggleSelection() {
    setState(() {
      isSelected = !isSelected; // Changes between true and false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select / Not Selected Exercise'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggleSelection, // Calls the function to toggle selection
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.red, // Changes color
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              isSelected ? 'Selected' : 'Not Selected', // Changes text
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
