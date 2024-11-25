import 'package:flutter/material.dart';

String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

Future<void> showSnackbar(BuildContext context, String label) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(label),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 10),
    ),
  );
}
