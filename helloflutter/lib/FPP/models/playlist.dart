// playlist.dart
import 'song.dart'; // Import Song class

class Playlist {
  final String id;
  final String name;
  final String description;
  final List<Song> songs;
  final DateTime createdDate;
  final DateTime updatedDate;

  Playlist({
    required this.id,
    required this.name,
    required this.description,
    required this.songs,
    required this.createdDate,
    required this.updatedDate,
  });

  // Get the count of songs in the playlist
  int getSongCount() {
    print('Song Count: ${songs.length}');
    return songs.length;
  }

  // Add a song to the playlist
  void addSong(Song song) {
    songs.add(song);
  }

  // Remove a song from the playlist
  void removeSong(Song song) {
    songs.remove(song);
  }

  @override
  String toString() {
    return 'Playlist{id: $id, name: $name, description: $description, songCount: ${songs.length}}';
  }
}
