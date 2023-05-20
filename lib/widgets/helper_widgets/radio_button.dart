import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ms/screens/boxs/sized_boxs.dart';

class MyRadioButton extends HookConsumerWidget {
  const MyRadioButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isPlaying = useState<bool>(true);
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
