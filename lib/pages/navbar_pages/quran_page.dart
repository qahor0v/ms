// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:ms/screens/boxs/sized_boxs.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:ms/services/database/quran_data.dart';
import 'package:ms/widgets/helper_widgets/like_button.dart';
import 'package:quran_uz/quran_uz.dart';

class QuranPage extends StatefulHookConsumerWidget {
  const QuranPage({super.key});

  @override
  ConsumerState<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends ConsumerState<QuranPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: QuranData.quranUz.suraList.length,
                  (context, index) {
                    final sura = QuranData.quranUz.suraList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OpenSurahPage(
                              id: sura.id,
                              name: sura.nameUz,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 8.0, right: 16.0),
                        decoration: BoxDecoration(
                            color: kBgColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black,
                              ),
                              child: Text(
                                "${index + 1}",
                                style: GoogleFonts.lilitaOne(
                                  color: mainColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            WBox(16.0),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sura.nameUz,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  HBox(8.0),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      sura.nameAr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OpenSurahPage extends HookConsumerWidget {
  final String name;
  final int id;
  const OpenSurahPage({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context, ref) {
    final audioPlayer = useState(AudioPlayer());
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8.0,
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: QuranData.verses(id).length,
                (context, index) {
                  return OyatAudioTextWidget(
                    verse: QuranData.verses(id)[index],
                    audioPlayer: audioPlayer,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OyatAudioTextWidget extends HookConsumerWidget {
  final Verse verse;
  final ValueNotifier<AudioPlayer> audioPlayer;
  const OyatAudioTextWidget({
    super.key,
    required this.verse,
    required this.audioPlayer,
  });

  @override
  Widget build(BuildContext context, ref) {
    final opened = useState<bool>(false);
    final isPlaying = useState<bool>(false);
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: kBgColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(8.0),
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  if (isPlaying.value && audioPlayer.value.playing) {
                    await audioPlayer.value.pause().then((value) {
                      isPlaying.value = false;
                    });
                  } else {
                    audioPlayer.value
                        .setUrl(verse.audio.medium)
                        .then((value) async {
                      isPlaying.value = true;
                      audioPlayer.value.play();
                    });
                  }
                },
                child: SizedBox(
                  child: Icon(isPlaying.value ? Icons.pause : Icons.play_arrow,
                      size: 30,
                      color: isPlaying.value ? mainColor : Colors.white),
                ),
              ),
              WBox(8.0),
              Text(
                "${verse.verseId} - оят",
                style: const TextStyle(color: Colors.white),
              ),
              WBox(16.0),
              Expanded(
                child: isPlaying.value
                    ? audioPlayer.value.durationStream != null
                        ? StreamBuilder<Duration?>(
                            stream: audioPlayer.value.durationStream,
                            builder: (context, sd) {
                              try {
                                return StreamBuilder<Duration>(
                                    stream: audioPlayer.value.positionStream,
                                    builder: (context, sp) {
                                      try {
                                        if (sp.data!.inSeconds /
                                                (sd.data != null
                                                    ? sd.data!.inSeconds
                                                    : 0.0) ==
                                            1.0) {
                                          Future.delayed(Duration.zero,
                                              () async {
                                            isPlaying.value = false;
                                            await audioPlayer.value.stop();
                                          });
                                        }
                                        if (sp.hasData) {
                                          return LinearProgressIndicator(
                                            backgroundColor: kBgColor,
                                            value: sp.data!.inSeconds /
                                                (sd.data != null
                                                    ? sd.data!.inSeconds
                                                    : 0.0),
                                            color: mainColor,
                                          );
                                        } else if (sp.connectionState ==
                                            ConnectionState.waiting) {
                                          return const LinearProgressIndicator(
                                            backgroundColor: kBgColor,
                                            value: null,
                                            color: mainColor,
                                          );
                                        } else {
                                          return const SizedBox();
                                        }
                                      } catch (e) {
                                        return const SizedBox();
                                      }
                                    });
                              } catch (e) {
                                return const SizedBox();
                              }
                            })
                        : const SizedBox()
                    : const SizedBox(),
              ),
              WBox(16.0),
              const LikeButton(onlyIcon: true),
              WBox(8.0),
              MaterialButton(
                padding: EdgeInsets.zero,
                minWidth: 0.0,
                height: 0.0,
                onPressed: () {
                  opened.value = !opened.value;
                },
                child: Icon(
                  opened.value
                      ? IconlyLight.arrow_up_2
                      : IconlyLight.arrow_down_2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          opened.value
              ? AnimatedOpacity(
                  opacity: opened.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      HBox(12.0),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 32,
                          bottom: 8.0,
                        ),
                        child: Text(
                          verse.meaning,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 32,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            verse.arabic.trim(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : WBox(0.0),
        ],
      ),
    );
  }
}

/*
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

*/
