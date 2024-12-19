import 'package:flutter/material.dart';

class CreatePlaylistDialog extends StatefulWidget {
  final Function(String) onSubmit;

  CreatePlaylistDialog({required this.onSubmit});

  @override
  _CreatePlaylistDialogState createState() => _CreatePlaylistDialogState();
}

class _CreatePlaylistDialogState extends State<CreatePlaylistDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleSubmit() {
    final playlistName = _controller.text.trim();
    if (playlistName.isNotEmpty) {
      widget.onSubmit(playlistName);
      Navigator.of(context).pop(); // Close the dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create New Playlist'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Enter playlist name'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Close without action
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: handleSubmit,
          child: Text('Create'),
        ),
      ],
    );
  }
}
