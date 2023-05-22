import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:ms/screens/boxs/sized_boxs.dart';
import 'package:ms/screens/boxs/sliver_box.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:ms/services/constants/asset_paths.dart';
import 'package:ms/widgets/helper_widgets/cached_image.dart';
import 'package:ms/widgets/helper_widgets/radio_button.dart';
import 'package:ms/widgets/home_widgets/last_listened_card.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isRadioPlaying = useState<bool>(true);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Muslim Sound",
          style: GoogleFonts.varelaRound(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.notification,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_outline,
            ),
          ),
          WBox(8.0),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/BHFO.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: MyRadioButton(
                isPlaying: isRadioPlaying,
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: MaterialButton(
                  onPressed: () {
                    isRadioPlaying.value = !isRadioPlaying.value;
                  },
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              const LastPlayedPlaylistWidget(),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  color: Colors.black54,
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 16,
                    right: 16,
                    bottom: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Yangi Ma'ruzalar",
                        style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Barchasi",
                          style: GoogleFonts.josefinSans(
                            color: mainColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const TopContentWidget(),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 16,
                    right: 16,
                    bottom: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Yangi Ma'ruzalar",
                        style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Barchasi",
                          style: GoogleFonts.josefinSans(
                            color: mainColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const TopContentWidget(),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 16,
                    right: 16,
                    bottom: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Yangi Ma'ruzalar",
                        style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Barchasi",
                          style: GoogleFonts.josefinSans(
                            color: mainColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const TopContentWidget(),
              SBox(80.0),
            ],
          ),
        ],
      ),
    );
  }
}

class TopContentWidget extends StatelessWidget {
  const TopContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.black54,
        height: 160,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 16 : 0.0, right: 16),
              child: SizedBox(
                height: 160,
                width: 100,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                      width: 100,
                      child: CachedImage(
                        url:
                            'http://i1.ytimg.com/vi/IIubZNPGLqU/maxresdefault.jpg',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    HBox(3.0),
                    Expanded(
                      child: Text(
                        "Lorem Ipsum Dolor Loremov Ipsumbek",
                        style: GoogleFonts.exo(
                          textStyle: const TextStyle(
                            color: secondaryColor,
                            fontSize: 12,
                          ),
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
