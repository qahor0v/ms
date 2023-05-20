import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ms/services/playlist/services.dart';

final getPlaylistProvider = FutureProvider.family((ref, String id) async {
  final result = PlaylistServices.getPlaylistData(id);
  return result;
});
