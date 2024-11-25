import 'package:flutter/material.dart';
import 'package:pomodoro/utils/constants.dart';
import 'package:pomodoro/utils/fonts.dart';

class PomodoroOutlinedButton extends StatelessWidget {
  final Color color;
  final String label;
  const PomodoroOutlinedButton({
    super.key,
    this.color = const Color.fromARGB(255, 35, 90, 112),
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      enableFeedback: true,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(DesignConstants.buttonRadius),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppFonts.buttonStyle.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
