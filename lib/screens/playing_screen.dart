import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ms/screens/boxs/sized_boxs.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:ms/widgets/helper_widgets/like_button.dart';

class PlayAudioWidget extends HookConsumerWidget {
  const PlayAudioWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isPlaying = useState(false);
    return Container(
      decoration: const BoxDecoration(
        color: kBgColor,
      ),
      height: 50,
      width: double.infinity,
      child: Column(
        children: [
          const LinearProgressIndicator(
            minHeight: 1,
            value: 0.71,
            backgroundColor: secondaryColor,
            color: mainColor,
          ),
          Expanded(
            child: Row(
              children: [
                WBox(16.0),
                const LikeButton(
                  onlyIcon: true,
                  iconSize: 20,
                  useColor: false,
                ),
                WBox(8.0),
                const LikeButton(
                  onlyIcon: true,
                  dlIcon: true,
                  iconSize: 20,
                  useColor: false,
                ),
                WBox(8.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "The Playing music name of name of name",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                      HBox(2.0),
                      Text(
                        "The Playing music name of name of name",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                WBox(8.0),
                GestureDetector(
                  onTap: () {
                    isPlaying.value = !isPlaying.value;
                  },
                  child: SizedBox(
                      child: Icon(
                    isPlaying.value ? Icons.pause : Icons.play_arrow,
                    size: 24,
                    color: Colors.white,
                  )),
                ),
                WBox(16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlayButton extends HookConsumerWidget {
  final double size;
  const PlayButton({super.key, this.size = 24});

  @override
  Widget build(BuildContext context, ref) {
    final isPlaying = useState<bool>(false);
    return GestureDetector(
      onTap: () {
        isPlaying.value = !isPlaying.value;
      },
      child: SizedBox(
        child: Icon(
          isPlaying.value ? Icons.pause : Icons.play_arrow,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }
}
