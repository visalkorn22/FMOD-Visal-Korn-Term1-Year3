import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScoreBar(
              title: 'My score in Flutter',
              color: Colors.green[500]!,
            ),
            ScoreBar(
              title: 'My score in Dart',
              color: Colors.green[200]!,
            ),
            ScoreBar(
              title: 'My score in React',
              color: Colors.green[900]!,
            ),
            ScoreBar(
              title: 'My score in Flutter',
              color: Colors.blue[500]!,
            ),
            ScoreBar(
              title: 'My score in Dart',
              color: Colors.blue[200]!,
            ),
            ScoreBar(
              title: 'My score in React',
              color: Colors.blue[900]!,
            ),
          ],
        ),
      ),
    ),
  ));
}

class ScoreBar extends StatefulWidget {
  final String title;
  final Color color;
  const ScoreBar({
    required this.title,
    this.color = Colors.green,
    super.key,
  });

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int score = 0;
  void addScore() {
    if (score < 10) {
      setState(() {
        score++;
      });
    }
  }

  void removeScore() {
    if (score > 0) {
      setState(() {
        score--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 200,
        child: Center(
          child: Column(
            children: [
              Text(
                widget.title,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: removeScore, icon: Icon(Icons.remove)),
                  IconButton(onPressed: addScore, icon: Icon(Icons.add)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: LinearProgressIndicator(
                  // LinearProgressIndicator shows the score visually as a filling progress bar.
                  borderRadius: BorderRadius.circular(10),
                  minHeight: 50,
                  value: score /
                      10, //LinearProgressIndicator contain the value between 0.0 and 1.0
                  color: widget.color,
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
