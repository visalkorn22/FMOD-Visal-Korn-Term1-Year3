import 'package:flutter/material.dart';
import 'package:helloflutter/W5-S2/Ex-4/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: appColor,
            title: const Text("Favorite Jokes"),
          ),
          body: JokeCard(),
        ),
      ),
    );

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;
  const FavoriteCard(
      {super.key,
      required this.title,
      required this.description,
      required this.isFavorite,
      required this.onFavoriteClick});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(widget.description)
              ],
            ),
          ),
          IconButton(
              onPressed: widget.onFavoriteClick,
              icon: Icon(
                widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: widget.isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
