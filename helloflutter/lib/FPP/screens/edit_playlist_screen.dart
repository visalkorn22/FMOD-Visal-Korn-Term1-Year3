import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart';

class AudioPlayerScreen extends StatefulWidget {
  final Song song;

  AudioPlayerScreen({required this.song});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playSong();
  }

  void _playSong() async {
    try {
      await _audioPlayer.setUrl(widget.song.url);
      await _audioPlayer.play();
    } catch (e) {
      print("Error loading song: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.pause, size: 50, color: Colors.blueAccent),
              onPressed: () {
                _audioPlayer.pause(); // Pause the song
              },
            ),
            IconButton(
              icon: Icon(Icons.stop, size: 50, color: Colors.redAccent),
              onPressed: () {
                _audioPlayer.stop(); // Stop the song
              },
            ),
          ],
        ),
      ),
    );
  }
}
