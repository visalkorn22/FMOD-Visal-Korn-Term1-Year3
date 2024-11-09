import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Buttons"),
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            height: 100,
            child: ElevatedButton(
                onPressed: () => {}, child: Text("Not selected")),
          ),
        ),
      ),
    ));
