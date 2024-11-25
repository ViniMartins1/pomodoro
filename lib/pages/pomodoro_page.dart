import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/bloc/pomodoro_bloc.dart';
import 'package:pomodoro/bloc/pomodoro_event.dart';
import 'package:pomodoro/bloc/pomodoro_state.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/constants.dart';
import 'package:pomodoro/utils/fonts.dart';
import 'package:pomodoro/utils/functions.dart';
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
                      BlocBuilder<PomodoroBloc, PomodoroState>(
                        builder: (context, state) {
                          String time = '25:00';
                          if (state is PomodoroRunning || state is PomodoroPaused) {
                            final duration = (state as dynamic).duration;
                            time = formatDuration(duration);
                          } else if (state is PomodoroComplete) {
                            time = '00:00';
                          }
                          return Text(time, style: AppFonts.clockStyle);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DesignConstants.cardPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PomodoroOutlinedButton(
                    label: 'Iniciar',
                    onPressed: () {
                      context.read<PomodoroBloc>().add(StartPomodoroEvent());
                      showSnackbar(context, 'Pomodoro iniciado!');
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PomodoroOutlinedButton(
                    label: 'Parar',
                    onPressed: () {
                      context.read<PomodoroBloc>().add(ResetPomodoroEvent());
                    },
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
