import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:ms/screens/boxs/sized_boxs.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:ms/services/models/playlist_data_model.dart';

class LikeButton extends HookConsumerWidget {
  final bool useColor;
  final double iconSize;
  final bool useBorder;
  final bool onlyIcon;
  final bool dlIcon;

  const LikeButton({
    super.key,
    this.useBorder = false,
    this.onlyIcon = false,
    this.useColor = true,
    this.dlIcon = false,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context, ref) {
    final liked = useState<bool>(false);
    final downloaded = useState<bool>(false);
    return GestureDetector(
      onTap: () {
        downloaded.value = !downloaded.value;
        liked.value = !liked.value;
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 6,
          bottom: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: useBorder
              ? Border.all(color: Colors.white)
              : Border.all(
                  color: Colors.transparent,
                  width: 0.0,
                ),
          color: useColor ? kBgColor : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              dlIcon
                  ? downloaded.value
                      ? IconlyBold.download
                      : IconlyLight.download
                  : liked.value
                      ? Icons.bookmark_added
                      : Icons.bookmark_add_outlined,
              color: Colors.white,
              size: iconSize,
            ),
            onlyIcon ? const Text("") : WBox(4.0),
            onlyIcon
                ? const Text("")
                : Text(
                    liked.value ? "Saqlangan" : "Saqlash",
                    style: GoogleFonts.josefinSans(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class DLButton extends HookConsumerWidget {
  final double size;
  const DLButton({
    super.key,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context, ref) {
    final downloaded = useState<bool>(false);
    return GestureDetector(
      onTap: () {
        downloaded.value = !downloaded.value;
      },
      child: SizedBox(
        child: Icon(
          downloaded.value ? IconlyBold.download : IconlyLight.download,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}

class FavouriteButton extends HookConsumerWidget {
  final double size;
  const FavouriteButton({
    super.key,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context, ref) {
    final downloaded = useState<bool>(false);
    return GestureDetector(
      onTap: () {
        downloaded.value = !downloaded.value;
      },
      child: SizedBox(
        child: Icon(
          !downloaded.value ? Icons.bookmark_outline : Icons.bookmark_added,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  final PlaylistData data;
  final bool useBorder;
  const InfoButton({
    super.key,
    this.useBorder = false,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.only(top: 24.0),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: 12,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kBgColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HBox(12.0),
                    RichText(
                      text: TextSpan(
                        text: "To'plam nomi: ",
                        style: const TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: data.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    HBox(12.0),
                    RichText(
                      text: TextSpan(
                        text: "Muallif: ",
                        style: const TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: data.author,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    HBox(12.0),
                    RichText(
                      text: TextSpan(
                        text: "Ko'rishlar soni: ",
                        style: const TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: data.viewCount.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    HBox(12.0),
                    RichText(
                      text: TextSpan(
                        text: "Videolar soni: ",
                        style: const TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: data.playlists.length.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    HBox(16.0),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            left: 60,
                            right: 60,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Yopish",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 6,
          bottom: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: useBorder
              ? Border.all(color: Colors.white)
              : Border.all(
                  color: Colors.transparent,
                  width: 0.0,
                ),
          color: bgColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 16,
            ),
            WBox(4.0),
            Text(
              "Ma'lumot",
              style: GoogleFonts.josefinSans(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
