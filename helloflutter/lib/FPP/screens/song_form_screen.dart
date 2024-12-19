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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController artistController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill text fields with the current song details
    titleController.text = widget.song.title;
    artistController.text = widget.song.artist;
  }

  void _saveChanges() {
    final updatedSong = Song(
      id: widget.song.id,
      title: titleController.text,
      artist: artistController.text,
      name: '',
      assetPath: '',
      url: '',
    );

    widget.onSave(updatedSong);
    Navigator.pop(context); // Go back to the playlist screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Song'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Song Title'),
            ),
            TextField(
              controller: artistController,
              decoration: InputDecoration(labelText: 'Artist'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Save Changes'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
