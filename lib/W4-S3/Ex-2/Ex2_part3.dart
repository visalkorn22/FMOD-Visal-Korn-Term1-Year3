import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(
            title: 'Title 1',
            description: 'Description 1',
            isFavorite: true,
          ),
          FavoriteCard(
            title: 'Title 2',
            description: 'Description 2',
            isFavorite: false,
          ),
          FavoriteCard(
            title: 'Title 3',
            description: 'Description 3',
            isFavorite: true,
          ),
        ],
      ),
    ),
  ));
}

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isFavorite;
  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool isclick = false;
  IconData get heart => isclick ? Icons.favorite : Icons.favorite_border;
  Color get color => isclick ? Colors.red : Colors.grey;
  @override
  void initState() {
    super.initState(); // Call to the superclass ini method
    // use to set isclick based on widget.isFavorite
    isclick = widget.isFavorite;
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
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
                Text(widget.title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                SizedBox(height: 4),
                Text(widget.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
              icon: Icon(
                heart,
                color: color,
              ),
              onPressed: () {
                setState(() {
                  isclick = !isclick;
                });
              })
        ],
      ),
    );
  }
}
