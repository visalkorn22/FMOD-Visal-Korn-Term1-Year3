import 'package:flutter/material.dart';

void main() => runApp(MyWidget());

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<bool> isSelected = [false, false, false, false];

  //because get can not use with parameter so we use function instead
  String bText(int index) => isSelected[index] ? "Selected" : "Not Selected";
  Color backgroundColor(int index) =>
      isSelected[index] ? Colors.blue[500]! : Colors.blue[50]!;
  Color textColor(int index) => isSelected[index] ? Colors.white : Colors.black;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Statrfull widget - Button"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < isSelected.length; i++)
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  width: 400,
                  height: 100,
                  child: ElevatedButton(
                      onPressed: () => {
                            setState(() {
                              isSelected[i] = !isSelected[i];
                            })
                          },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor(i),
                      ),
                      child: Center(
                        child: Text(
                          bText(i),
                          style: TextStyle(
                            color: textColor(i),
                          ),
                        ),
                      )),
                ),
              ),
          ],
        )),
      ),
    );
  }
}
