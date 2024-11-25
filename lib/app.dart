import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/bloc/pomodoro_bloc.dart';
import 'package:pomodoro/pages/pomodoro_page.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro app',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PomodoroBloc(
              duration: const Duration(minutes: 25),
            ),
          ),
        ],
        child: const PomodoroPage(),
      ),
    );
  }
}
