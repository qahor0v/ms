import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyRadioButton extends HookConsumerWidget {
  final ValueNotifier<bool> isPlaying;
  const MyRadioButton({
    super.key,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context, ref) {
    return ElevatedButton.icon(
      onPressed: () {
        isPlaying.value = !isPlaying.value;
      },
      icon: Icon(
        isPlaying.value ? Icons.pause : Icons.play_arrow,
        color: Colors.white,
      ),
      label: const Text(
        "Radio",
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }
}
