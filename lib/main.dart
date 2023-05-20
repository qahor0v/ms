import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ms/pages/navbar_pages/home_page.dart';
import 'package:ms/pages/navbar_pages/quran_page.dart';
import 'package:ms/services/constants/app_colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muslim Cloud Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: primarySw,
      ),
      home: const HomePage(),
    );
  }
}
