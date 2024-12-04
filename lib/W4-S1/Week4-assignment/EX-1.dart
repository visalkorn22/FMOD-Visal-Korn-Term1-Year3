import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  const HobbyCard(
      {super.key,
      required String text,
      Color color = const Color(0xFF0000FF),
      required IconData icon})
      : _text = text,
        _color = color,
        _icon = icon;

  final String _text;
  final Color _color;
  final IconData _icon;

  IconData get cardIcon => _icon;
  Color get cardColor => _color;
  String get cardText => _text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Center(
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.all(30), child: Icon(cardIcon)),
            Text(cardText)
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.grey,
    appBar: AppBar(
      title: const Text(
        'My Hobbies',
        selectionColor: Color(0xFF000000),
        style: TextStyle(fontSize: 15),
      ),
      backgroundColor: Colors.white,
    ),
    body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HobbyCard(
                text: 'Travellings',
                color: Color(0xFF6FFF0F),
                icon: Icons.airplanemode_active),
            HobbyCard(
                text: 'Gaming', color: Color(0xFFFF0F00), icon: Icons.gamepad),
            HobbyCard(
                text: 'Music', color: Color(0xFFFFF000), icon: Icons.music_note)
          ],
        )),
  )));
}
