import 'package:flutter/material.dart';
import 'package:helloflutter/FPP/widget/playlist_tile.dart';
import '../models/app_state.dart';
import '../models/playlist.dart';
import '../models/song.dart'; // Import Song model
import 'playlist_detail_screen.dart'; // Import PlaylistDetailScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final appState = AppState();
  String searchQuery = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController songNameController = TextEditingController();
  TextEditingController songArtistController = TextEditingController();
  TextEditingController songUrlController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    songNameController.dispose();
    songArtistController.dispose();
    songUrlController.dispose();
    super.dispose();
  }

  // Method to create a playlist
  void _createPlaylist() {
    nameController.clear();
    descriptionController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create Playlist'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Playlist Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
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
              final newPlaylist = Playlist(
                id: DateTime.now().toString(),
                name: nameController.text.trim(),
                description: descriptionController.text.trim(),
                songs: [], // Empty list initially
                createdDate: DateTime.now(),
                updatedDate: DateTime.now(),
              );

              if (newPlaylist.name.isNotEmpty) {
                setState(() {
                  appState.addPlaylist(newPlaylist);
                });
                Navigator.pop(context);
              }
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
  }

  // Method to create a song
  void _createSong(Playlist playlist) {
    songNameController.clear();
    songArtistController.clear();
    songUrlController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Song to Playlist'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: songNameController,
              decoration: InputDecoration(labelText: 'Song Name'),
            ),
            TextField(
              controller: songArtistController,
              decoration: InputDecoration(labelText: 'Artist Name'),
            ),
            TextField(
              controller: songUrlController,
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
              final newSong = Song(
                id: DateTime.now().toString(),
                title: songNameController.text.trim(),
                artist: songArtistController.text.trim(),
                url: songUrlController.text.trim(), name: '',
                assetPath: '', // The URL is added here
              );

              if (newSong.title.isNotEmpty && newSong.url.isNotEmpty) {
                setState(() {
                  playlist.songs.add(newSong); // Add song to the playlist
                });
                Navigator.pop(context);
              }
            },
            child: Text('Add Song'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredPlaylists = appState.playlists.where((playlist) {
      return playlist.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          playlist.description
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Joyful Tunes'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PlaylistSearchDelegate(searchQuery),
              );
            },
          ),
        ],
      ),
      body: filteredPlaylists.isEmpty
          ? Center(child: Text('No playlists found.'))
          : ListView.builder(
              itemCount: filteredPlaylists.length,
              itemBuilder: (context, index) {
                final currentPlaylist = filteredPlaylists[index];
                return PlaylistTile(
                  playlist: currentPlaylist,
                  songCount: currentPlaylist
                      .getSongCount(), // Pass the song count here
                  onDelete: () {
                    setState(() {
                      appState.removePlaylist(currentPlaylist);
                    });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaylistDetailScreen(
                          playlist: currentPlaylist,
                        ),
                      ),
                    );
                  },
                  onEdit: () {
                    // Edit Playlist code here
                    _editPlaylist(currentPlaylist);
                  },
                  onAddSong: () {
                    // Trigger add song dialog
                    _createSong(currentPlaylist);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPlaylist,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  // Edit playlist
  void _editPlaylist(Playlist playlist) {
    nameController.text = playlist.name;
    descriptionController.text = playlist.description;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Playlist'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Playlist Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
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
              final updatedPlaylist = Playlist(
                id: playlist.id,
                name: nameController.text.trim(),
                description: descriptionController.text.trim(),
                songs: playlist.songs, // Keep the same songs list
                createdDate: playlist.createdDate,
                updatedDate: DateTime.now(),
              );

              setState(() {
                appState.removePlaylist(playlist); // Remove the old one
                appState.addPlaylist(updatedPlaylist); // Add the updated one
              });

              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

// Playlist search delegate
class PlaylistSearchDelegate extends SearchDelegate {
  final String searchQuery;
  PlaylistSearchDelegate(this.searchQuery);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = context
        .findAncestorStateOfType<_HomeScreenState>()!
        .appState
        .playlists
        .where((playlist) {
      return playlist.name.toLowerCase().contains(query.toLowerCase()) ||
          playlist.description.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final playlist = results[index];
        return ListTile(
          title: Text(playlist.name),
          subtitle: Text(
              'Songs: ${playlist.getSongCount()}'), // Display the song count here
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlaylistDetailScreen(
                  playlist: playlist,
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
