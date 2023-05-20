import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:ms/screens/boxs/sized_boxs.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:ms/services/constants/asset_paths.dart';

class LastPlayedPlaylistWidget extends StatelessWidget {
  const LastPlayedPlaylistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            center: Alignment.topLeft,
            radius: 0.8,
            colors: [
              mainColor,
              Colors.purple,
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 6,
                      bottom: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: bgColor,
                    ),
                    child: Text(
                      "Oxirgi tinglangan",
                      style: GoogleFonts.josefinSans(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  HBox(8.0),
                  const Spacer(),
                  Text(
                    "The Playlist Name Chapter Name Lorem Ipsum",
                    style: GoogleFonts.signikaNegative(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    maxLines: 3,
                  ),
                  HBox(8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 6,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: bgColor,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              IconlyLight.play,
                              color: Colors.white,
                              size: 16,
                            ),
                            WBox(4.0),
                            Text(
                              "Davom et.",
                              style: GoogleFonts.josefinSans(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      WBox(8.0),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 6,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: bgColor,
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
            WBox(8.0),
            Expanded(
              flex: 3,
              child: Lottie.asset(MyLotties.domla),
            )
          ],
        ),
      ),
    );
  }
}
