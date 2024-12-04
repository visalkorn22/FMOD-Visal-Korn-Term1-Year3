import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Loop widget list for Example'),
          ),
          body: Center(
            child: Column(
              children: [
                Text("Start",
                    style: TextStyle(fontSize: 24, color: Colors.blue)),

                // Using the "for" loop directly within the list of widgets
                for (var i = 0; i < 10; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Item $i',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                Text("End", style: TextStyle(fontSize: 24, color: Colors.blue)),
              ],
            ),
          )),
    ));
