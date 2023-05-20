// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:ms/screens/boxs/sized_boxs.dart';
import 'package:ms/screens/playing_screen.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:ms/services/constants/asset_paths.dart';
import 'package:ms/services/playlist/providers.dart';
import 'package:ms/widgets/helper_widgets/like_button.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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
                      title: Text(
                        pl.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        maxLines: 3,
                      ),
                      subtitle: Text(
                        pl.author,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                      ),
                      leading: Image.network(pl.thumbnail),
                    );
                  },
                  childCount: data.playlists.length,
                ),
              ),
            ],
          );
        },
        error: (e, m) {},
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
