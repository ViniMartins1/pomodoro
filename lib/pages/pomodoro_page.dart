import 'package:flutter/material.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/constants.dart';
import 'package:pomodoro/utils/fonts.dart';
import 'package:pomodoro/widgets/outline_button.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(DesignConstants.cardPadding),
                  padding: EdgeInsets.all(DesignConstants.cardPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(DesignConstants.cardRadius),
                    color: AppColors.cyan,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('25:00', style: AppFonts.clockStyle),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DesignConstants.cardPadding),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PomodoroOutlinedButton(
                    label: 'Iniciar',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: PomodoroOutlinedButton(
                    label: 'Parar',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
