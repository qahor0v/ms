// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:iconly/iconly.dart';
// import 'package:ms/pages/navbar_pages/bookmark_page.dart';
// import 'package:ms/pages/navbar_pages/download_page.dart';
// import 'package:ms/pages/navbar_pages/home_page.dart';
// import 'package:ms/pages/navbar_pages/quran_page.dart';
// import 'package:ms/services/constants/app_colors.dart';
// import 'package:ms/services/constants/asset_paths.dart';

// class Home extends HookWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final index = useState<int>(0);
//     final controller = useState<PageController>(PageController());
//     return Scaffold(
//       body: PageView(
//         controller: controller.value,
//         onPageChanged: (int current) {
//           index.value = current;
//         },
//         children: const [
//           HomePage(),
//           QuranPage(),
//           BookmarkPage(),
//           DownloadPage(),
//         ],
//       ),
//       bottomNavigationBar: NavBar(controller: controller, index: index),
//     );
//   }
// }

// class NavBar extends HookWidget {
//   final ValueNotifier<int> index;
//   final ValueNotifier<PageController> controller;
//   const NavBar({
//     super.key,
//     required this.controller,
//     required this.index,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 72,
//       color: kBgColor,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(
//             child: index.value == 0
//                 ? const Icon(
//                     IconlyLight.home,
//                     color: mainColor,
//                     size: 32,
//                   )
//                 : IconButton(
//                     onPressed: () {
//                       index.value = 0;
//                       controller.value.jumpToPage(0);
//                     },
//                     icon: const Icon(
//                       IconlyLight.home,
//                       size: 32,
//                       color: secondaryColor,
//                     ),
//                   ),
//           ),
//           Expanded(
//             child: index.value == 1
//                 ? const ImageIcon(
//                     AssetImage(MyIcons.quran),
//                     size: 32,
//                     color: mainColor,
//                   )
//                 : IconButton(
//                     onPressed: () {
//                       index.value = 1;
//                       controller.value.jumpToPage(1);
//                     },
//                     icon: const ImageIcon(
//                       AssetImage(MyIcons.quran),
//                       size: 32,
//                       color: secondaryColor,
//                     ),
//                   ),
//           ),
//           Expanded(
//             child: index.value == 2
//                 ? const Icon(
//                     IconlyLight.bookmark,
//                     color: mainColor,
//                     size: 32,
//                   )
//                 : IconButton(
//                     onPressed: () {
//                       index.value = 2;
//                       controller.value.jumpToPage(2);
//                     },
//                     icon: const Icon(
//                       IconlyLight.bookmark,
//                       size: 32,
//                       color: secondaryColor,
//                     ),
//                   ),
//           ),
//           Expanded(
//             child: index.value == 3
//                 ? const Icon(
//                     IconlyLight.download,
//                     color: mainColor,
//                     size: 32,
//                   )
//                 : IconButton(
//                     onPressed: () {
//                       index.value = 3;
//                       controller.value.jumpToPage(3);
//                     },
//                     icon: const Icon(
//                       IconlyLight.download,
//                       size: 32,
//                       color: secondaryColor,
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
