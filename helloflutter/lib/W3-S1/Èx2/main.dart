import 'package:flutter/material.dart';

abstract class AbstractWidget {
  AbstractWidget({this.id});

  final int? id;

  Widget build();
}

class MyWidget extends AbstractWidget {
  MyWidget(this.text, {super.id});

  final String text;

  @override
  Widget build() {
    return Text(text);
  }
}

void main() {
  List<AbstractWidget> customWidgets = [
    MyWidget("widget 1"),
    MyWidget("widget 2", id: 10),
    MyWidget("widget 3", id: 11),
  ];

  // This is equivalent to  the map() bellow...

  // List<Widget> getWidgets() {
  //   List<Widget> widgets = [];
  //   for (AbstractWidget aw in customWidgets) {
  //     widgets.add(aw.build());
  //   }
  //   return widgets;
  // }

  runApp(MaterialApp(
      home: Column(
    children: customWidgets.map((cw) {
      return cw.build();
    }).toList(),
  )));
}
