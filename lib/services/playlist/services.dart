import 'package:ms/services/models/playlist_data_model.dart';
import 'package:ms/services/models/playlist_item_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class PlaylistServices {
  static final yt = YoutubeExplode();

  static Future<PlaylistData> getPlaylistData(String id) async {
    var playlist = await yt.playlists.get(id);
    List<PlaylistItem> playlists = [];

    await for (var video in yt.playlists.getVideos(playlist.id)) {
      playlists.add(
        PlaylistItem(
          title: video.title,
          author: video.author,
          url: video.url,
          id: id,
          thumbnail: video.thumbnails.mediumResUrl,
          viewCount: video.engagement.viewCount,
        ),
      );
    }

    return PlaylistData(
      title: playlist.title,
      id: playlist.id.value,
      author: playlist.author,
      url: playlist.url,
      viewCount: playlist.engagement.viewCount,
      playlists: playlists,
    );
  }

  static getPlaylistVideos(String id) async {
    var video = await yt.videos.get('https://youtube.com/watch?v=Dpp1sIL1m5Q');

    var title = video.title;
    var author = video.author;
    var duration = video.duration;

    video.thumbnails.mediumResUrl;
  }
}


