class PlaylistItem {
  String title;
  String author;
  String url;
  String id;
  String thumbnail;
  int viewCount;
  Duration? duration;
  PlaylistItem({
    required this.title,
    required this.author,
    required this.url,
    required this.id,
    required this.thumbnail,
    required this.viewCount,
    this.duration,
  });
}

