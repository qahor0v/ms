// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
 import 'package:hooks_riverpod/hooks_riverpod.dart';
 import 'package:ms/screens/playing_screen.dart';
 import 'package:ms/services/playlist/providers.dart';
 import 'package:ms/widgets/helper_widgets/like_button.dart';

class QuranPage extends StatefulHookConsumerWidget {
  const QuranPage({super.key});

  @override
  ConsumerState<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends ConsumerState<QuranPage> {
  @override
  Widget build(BuildContext context) {
    final getPlaylist =
        ref.watch(getPlaylistProvider('PLcKj-sKokY8H1mQI31xfOTq9m7A_rJQJc'));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Category Name"),
      ),
      body: getPlaylist.when(
        data: (data) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final pl = data.playlists[index];
                    return ListTile(
                      minLeadingWidth: 8.0,
                      horizontalTitleGap: 8.0,
                      minVerticalPadding: 8.0,
                      title: Text(
                        pl.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                      ),
                      subtitle: Text(
                        pl.author,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                      ),
                      leading: Container(
                        clipBehavior: Clip.none,
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              pl.thumbnail,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.black45,
                          ),
                          child: const PlayButton(size: 32),
                        ),
                      ),
                      trailing: SizedBox(
                        height: 48,
                        width: 54,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            DLButton(),
                            FavouriteButton(),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: data.playlists.length,
                ),
              ),
            ],
          );
        },
        error: (e, m) {
          return const Text("error");
        },
        loading: () => const CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
      floatingActionButton: const PlayAudioWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class OpenPlaylistPage extends StatelessWidget {
  const OpenPlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
