import 'package:equatable/equatable.dart';

class PomodoroEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PausePomodoroEvent extends PomodoroEvent {
  @override
  List<Object> get props => [];
}

class ResumePomodoroEvent extends PomodoroEvent {
  @override
  List<Object> get props => [];
}

class StartPomodoroEvent extends PomodoroEvent {
  @override
  List<Object> get props => [];
}

class ResetPomodoroEvent extends PomodoroEvent {
  @override
  List<Object> get props => [];
}

class TickPomodoroEvent extends PomodoroEvent {
  final Duration duration;

  TickPomodoroEvent({required this.duration});

  @override
  List<Object> get props => [duration];
}
