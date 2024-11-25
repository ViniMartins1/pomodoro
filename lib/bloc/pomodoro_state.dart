import 'package:equatable/equatable.dart';

abstract class PomodoroState extends Equatable {
  const PomodoroState();
}

class PomodoroInitial extends PomodoroState {
  final Duration duration;

  const PomodoroInitial({required this.duration});

  @override
  List<Object?> get props => [duration];
}

class PomodoroRunning extends PomodoroState {
  final Duration duration;

  const PomodoroRunning({required this.duration});

  @override
  List<Object?> get props => [duration];
}

class PomodoroPaused extends PomodoroState {
  final Duration duration;

  const PomodoroPaused({required this.duration});

  @override
  List<Object?> get props => [duration];
}

class PomodoroComplete extends PomodoroState {
  const PomodoroComplete();

  @override
  List<Object?> get props => [];
}
