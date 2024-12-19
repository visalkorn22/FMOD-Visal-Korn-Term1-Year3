import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(JoyfulTunesApp());
}

class JoyfulTunesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joyful Tunes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
