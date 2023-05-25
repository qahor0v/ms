import 'package:audio_wave/audio_wave.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:ms/widgets/helper_widgets/radio_button.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.7,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: CachedNetworkImageProvider(
                      "https://i.ytimg.com/vi/Vt6scEgO7qE/maxresdefault.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AudioWave(
                      height: 32,
                      width: 160,
                      animation: true,
                      spacing: 5,
                      alignment: 'bottom',
                      animationLoop: 100000000,
                      beatRate: const Duration(milliseconds: 50),
                      bars: [
                        AudioWaveBar(
                            heightFactor: 1, color: Colors.lightBlueAccent),
                        AudioWaveBar(heightFactor: 0.9, color: Colors.blue),
                        AudioWaveBar(heightFactor: 0.8, color: Colors.black),
                        AudioWaveBar(heightFactor: 0.7),
                        AudioWaveBar(heightFactor: 0.6, color: Colors.orange),
                        AudioWaveBar(
                            heightFactor: 0.5, color: Colors.lightBlueAccent),
                        AudioWaveBar(heightFactor: 0.4, color: Colors.blue),
                        AudioWaveBar(heightFactor: 0.3, color: Colors.black),
                        AudioWaveBar(heightFactor: 0.2),
                        AudioWaveBar(heightFactor: 0.1, color: Colors.orange),
                        AudioWaveBar(
                            heightFactor: 1, color: Colors.lightBlueAccent),
                        AudioWaveBar(heightFactor: 0.1, color: Colors.blue),
                        AudioWaveBar(heightFactor: 0.2, color: Colors.black),
                        AudioWaveBar(heightFactor: 0.3),
                        AudioWaveBar(heightFactor: 0.4, color: Colors.orange),
                        AudioWaveBar(
                            heightFactor: 0.5, color: Colors.lightBlueAccent),
                        AudioWaveBar(heightFactor: 0.6, color: Colors.blue),
                        AudioWaveBar(heightFactor: 0.7, color: Colors.black),
                        AudioWaveBar(heightFactor: 0.8),
                        AudioWaveBar(heightFactor: 0.9, color: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
