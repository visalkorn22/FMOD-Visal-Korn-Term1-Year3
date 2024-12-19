import 'package:flutter/material.dart';
import '../models/playlist.dart';
import '../models/song.dart';
import 'audio_player_screen.dart';

class PlaylistDetailScreen extends StatefulWidget {
  final Playlist playlist;

  PlaylistDetailScreen({required this.playlist});

  @override
  _PlaylistDetailScreenState createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController artistController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    artistController.dispose();
    urlController.dispose();
    super.dispose();
  }

  // Function to add a new song to the playlist
  void _addSong() {
    final name = nameController.text.trim();
    final artist = artistController.text.trim();
    final url = urlController.text.trim(); // Get URL from the input

    if (name.isNotEmpty && artist.isNotEmpty && url.isNotEmpty) {
      final newSong = Song(
        id: DateTime.now().toString(),
        name: name,
        artist: artist,
        url: url,
        title: '',
        assetPath: '',
      );

      setState(() {
        widget.playlist.songs.add(newSong);
      });
      nameController.clear();
      artistController.clear();
      urlController.clear();
    }
  }

  // Function to edit a song's details
  void _editSong(Song song) {
    nameController.text = song.name;
    artistController.text = song.artist;
    urlController.text = song.url;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Song'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Song Title'),
            ),
            TextField(
              controller: artistController,
              decoration: InputDecoration(labelText: 'Artist Name'),
            ),
            TextField(
              controller: urlController,
              decoration: InputDecoration(labelText: 'Song URL'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                song.name = nameController.text.trim();
                song.artist = artistController.text.trim();
                song.url = urlController.text.trim();
              });
              Navigator.pop(context);
            },
            child: Text('Save Changes'),
          ),
        ],
      ),
    );
  }

  // Function to delete a song from the playlist
  void _deleteSong(Song song) {
    setState(() {
      widget.playlist.songs.remove(song);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.playlist.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Songs: ${widget.playlist.songs.length}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.playlist.songs.length,
              itemBuilder: (context, index) {
                final currentSong = widget.playlist.songs[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(currentSong.name),
                    subtitle: Text(currentSong.artist),
                    onTap: () {
                      // Navigate to AudioPlayerScreen with selected song
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioPlayerScreen(
                            song: currentSong,
                          ),
                        ),
                      );
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit button
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editSong(currentSong); // Open the edit dialog
                          },
                        ),
                        // Delete button
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteSong(currentSong); // Delete the song
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Add Song Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Song Name'),
                ),
                TextField(
                  controller: artistController,
                  decoration: InputDecoration(labelText: 'Artist Name'),
                ),
                TextField(
                  controller: urlController,
                  decoration: InputDecoration(labelText: 'Song URL'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addSong,
                  child: Text('Add Song'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
