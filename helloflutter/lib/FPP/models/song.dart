class Song {
  final String id;
  late final String title;
  late final String artist;
  late final String name;
  final String assetPath;
  late final String url;

  Song(
      {required this.id,
      required this.title,
      required this.artist,
      required this.name,
      required this.assetPath,
      required this.url});
}
