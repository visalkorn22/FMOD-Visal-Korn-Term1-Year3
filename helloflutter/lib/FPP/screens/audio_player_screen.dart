import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart'; // Make sure the Song model is imported

class AudioPlayerScreen extends StatefulWidget {
  final Song song;

  AudioPlayerScreen({required this.song});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer(); // AudioPlayer instance

  @override
  void initState() {
    super.initState();
    _audioPlayer.setUrl(widget.song.url); // Set the song's URL for playback
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.song.name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(
                _audioPlayer.playing ? Icons.pause : Icons.play_arrow,
                size: 50,
              ),
              onPressed: _playPause, // Handle play/pause
            ),
          ],
        ),
      ),
    );
  }
}
