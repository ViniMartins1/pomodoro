import 'package:flutter/material.dart';

String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

Future<void> showSnackbar(
  BuildContext context,
  String label, {
  Color backgroundColor = Colors.green,
}) async {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => _AnimatedSnackBar(
      label: label,
      backgroundColor: backgroundColor,
    ),
  );

  overlay.insert(overlayEntry);
  await Future.delayed(const Duration(seconds: 2));
  overlayEntry.remove();
}

class _AnimatedSnackBar extends StatefulWidget {
  final String label;
  final Color backgroundColor;

  const _AnimatedSnackBar({
    required this.label,
    this.backgroundColor = Colors.green,
  });

  @override
  State<_AnimatedSnackBar> createState() => _AnimatedSnackBarState();
}

class _AnimatedSnackBarState extends State<_AnimatedSnackBar> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      left: 16.0,
      right: 16.0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          elevation: 6.0,
          borderRadius: BorderRadius.circular(8),
          color: widget.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Text(
              widget.label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
