import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
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
  int score = 1;

  void addScore() {
    if (score < 10) {
      setState(() {
        score++;
      });
    }
  }

  void removeScore() {
    if (score > 1) {
      setState(() {
        score--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: removeScore,
                  icon: Icon(Icons.remove),
                  color: Colors.black54,
                  iconSize: 30,
                ),
                Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$score',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: addScore,
                  icon: Icon(Icons.add),
                  color: Colors.black54,
                  iconSize: 30,
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: score / 10,
                  minHeight: 15,
                  color: widget.color,
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
