import 'package:flutter/material.dart';
import '../models/song.dart';

class EditSongScreen extends StatefulWidget {
  final Song song;
  final Function(Song) onSave;

  EditSongScreen({required this.song, required this.onSave});

  @override
  _EditSongScreenState createState() => _EditSongScreenState();
}

class _EditSongScreenState extends State<EditSongScreen> {
  late TextEditingController titleController;
  late TextEditingController artistController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.song.title);
    artistController = TextEditingController(text: widget.song.artist);
  }

  @override
  void dispose() {
    titleController.dispose();
    artistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Song'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: artistController,
              decoration: InputDecoration(labelText: 'Artist'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedSong = Song(
                  id: widget.song.id,
                  title: titleController.text,
                  artist: artistController.text,
                  name: '',
                  assetPath: '',
                  url: '',
                );
                widget.onSave(updatedSong);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
