import 'package:flutter/material.dart';

List<String> images = [
  "assets/W4-S3/bird.jpg",
  "assets/W4-S3/bird2.jpg",
  "assets/W4-S3/insect.jpg",
  "assets/W4-S3/girl.jpg",
  "assets/W4-S3/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner:
          false, // Why this line ? Can you explain it ? to delete the word which is show on the right appbar
      home: Picture(),
    ));

class Picture extends StatefulWidget {
  const Picture({
    super.key,
  });

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  int index = 0;
  void previous() {
    setState(() {
      if (index > 0) {
        index--; // Move to the previous item
      } else {
        index = images.length -
            1; // use to Wrap around from last image of the list to the last image
      }
    });
  }

  void next() {
    setState(() {
      if (index < images.length - 1) {
        index++; // Move to the next item
      } else {
        index = 0; // use to Wrap around to the first image
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previous,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: next,
            ),
          ),
        ],
      ),
      body: Image.asset(images[index]),
    );
  }
}
