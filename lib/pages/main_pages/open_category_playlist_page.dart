import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms/screens/boxs/sized_boxs.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:ms/widgets/helper_widgets/cached_image.dart';
class OpenCategoryPlaylistPage extends StatelessWidget {
  const OpenCategoryPlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const PlaylistCardWidget();
                },
                childCount: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class PlaylistCardWidget extends StatelessWidget {
  const PlaylistCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 80,
                width: 140,
                child: Stack(
                  children: [
                    const CachedImage(
                      url:
                          'http://i1.ytimg.com/vi/IIubZNPGLqU/maxresdefault.jpg',
                      height: 80,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                          color: Colors.black54,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.library_music,
                                color: Colors.white70,
                                size: 17,
                              ),
                              WBox(4.0),
                              const Text(
                                "44 ta audio",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            WBox(8.0),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "The Playlist Name Of Plylist Name Of Playlist Name",
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  HBox(8.0),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 18,
                      ),
                      WBox(4.0),
                      const Text(
                        "48674",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 6,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: mainColor,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.bookmark_border_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                            WBox(4.0),
                            Text(
                              "Saqlash",
                              style: GoogleFonts.josefinSans(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
