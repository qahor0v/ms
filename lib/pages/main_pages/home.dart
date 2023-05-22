import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ms/pages/navbar_pages/bookmark_page.dart';
import 'package:ms/pages/navbar_pages/download_page.dart';
import 'package:ms/pages/navbar_pages/home_page.dart';
import 'package:ms/pages/navbar_pages/quran_page.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:ms/services/constants/asset_paths.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final index = useState<int>(0);
    final controller = useState<PageController>(PageController());
    return Scaffold(
      body: PageView(
        controller: controller.value,
        onPageChanged: (int current) {
          index.value = current;
        },
        children: const [
          HomePage(),
          QuranPage(),
          BookmarkPage(),
          DownloadPage(),
        ],
      ),
      bottomNavigationBar: NavBar(controller: controller, index: index),
    );
  }
}

class NavBar extends HookWidget {
  final ValueNotifier<int> index;
  final ValueNotifier<PageController> controller;
  const NavBar({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 12.0,
        top: 12.0,
      ),
      itemPadding: const EdgeInsets.all(8.0),
      currentIndex: index.value,
      onTap: (int value) {
        index.value = value;
        controller.value.jumpToPage(value);
      },
      items: [
        SalomonBottomBarItem(
          icon: const ImageIcon(
            AssetImage(MyIcons.radio),
          ),
          title: const Text("Radio"),
          selectedColor: mainColor,
          unselectedColor: Colors.white,
        ),
        SalomonBottomBarItem(
          icon: const ImageIcon(
            AssetImage(MyIcons.quran),
          ),
          title: const Text("Qur'on"),
          selectedColor: mainColor,
          unselectedColor: Colors.white,
        ),
        SalomonBottomBarItem(
          icon: const ImageIcon(
            AssetImage(MyIcons.bookmarks),
          ),
          title: const Text("Saqlanganlar"),
          selectedColor: mainColor,
          unselectedColor: Colors.white,
        ),
        SalomonBottomBarItem(
          icon: const ImageIcon(
            AssetImage(MyIcons.downloads),
          ),
          title: const Text("Yuklanganlar"),
          selectedColor: mainColor,
          unselectedColor: Colors.white,
        ),
      ],
    );
  }
}
