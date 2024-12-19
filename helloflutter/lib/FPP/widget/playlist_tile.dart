import 'package:flutter/material.dart';
import 'package:helloflutter/FPP/models/playlist.dart';

class PlaylistTile extends StatelessWidget {
  final Playlist playlist;
  final int songCount;
  final Function onDelete;
  final Function onTap;
  final Function onEdit;
  final Function onAddSong;

  PlaylistTile({
    required this.playlist,
    required this.songCount,
    required this.onDelete,
    required this.onTap,
    required this.onEdit,
    required this.onAddSong,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(playlist.name),
      subtitle: Text('Songs: $songCount'),
      onTap: () => onTap(),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => onEdit(),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => onDelete(),
          ),
        ],
      ),
      onLongPress: () => onAddSong(),
    );
  }
}
