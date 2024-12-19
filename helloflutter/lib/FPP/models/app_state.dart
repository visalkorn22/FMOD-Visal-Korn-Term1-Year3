import 'playlist.dart'; // Import Playlist class

class AppState {
  List<Playlist> playlists = [];
  Playlist? currentPlaylist;

  // Add a playlist
  void addPlaylist(Playlist playlist) {
    playlists.add(playlist);
  }

  // Remove a playlist
  void removePlaylist(Playlist playlist) {
    playlists.remove(playlist);
  }

  // Update a playlist
  void updatePlaylist(Playlist updatedPlaylist) {
    int index =
        playlists.indexWhere((playlist) => playlist.id == updatedPlaylist.id);
    if (index != -1) {
      playlists[index] =
          updatedPlaylist; // Replace the playlist with the updated one
    }
  }

  // Find a playlist by ID
  Playlist? findPlaylistById(String id) {
    try {
      return playlists.firstWhere((playlist) => playlist.id == id);
    } catch (e) {
      return null;
    }
  }

  // Clear all data
  void clearAllData() {
    playlists.clear();
    currentPlaylist = null;
  }
}
