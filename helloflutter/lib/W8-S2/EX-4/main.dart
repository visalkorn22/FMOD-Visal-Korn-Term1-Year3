import 'package:flutter/material.dart';
import 'screens/device_converter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 1, 106, 242),
              Color.fromARGB(255, 6, 205, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const DeviceConverter(),
      ),
    ),
  ));
}
