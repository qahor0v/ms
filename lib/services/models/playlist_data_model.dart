
import 'package:ms/services/models/playlist_item_model.dart';

class PlaylistData {
  String title;
  String author;
  String url;
  String id;
  List<PlaylistItem> playlists;
  int viewCount;

  PlaylistData({
    required this.title,
    required this.id,
    required this.author,
    required this.url,
    required this.viewCount,
    required this.playlists,
  });
}
