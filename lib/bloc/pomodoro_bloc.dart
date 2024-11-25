import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/bloc/pomodoro_event.dart';
import 'package:pomodoro/bloc/pomodoro_state.dart';
import 'package:pomodoro/model/pomodoro_ticker.dart';

class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  PomodoroBloc({required this.duration}) : super(PomodoroInitial(duration: duration)) {
    on<StartPomodoroEvent>(_onStart);
    on<PausePomodoroEvent>(_onPause);
    on<ResumePomodoroEvent>(_onResume);
    on<ResetPomodoroEvent>(_onReset);
    on<TickPomodoroEvent>(_onTick);
  }

  final Duration duration;
  Ticker? _tickerSubscription;

  void _onStart(StartPomodoroEvent event, Emitter<PomodoroState> emit) {
    _tickerSubscription = Ticker(tick: _onTickCallback)..start(duration);
    emit(PomodoroRunning(duration: duration));
  }

  void _onPause(PausePomodoroEvent event, Emitter<PomodoroState> emit) {
    _tickerSubscription?.pause();
    if (state is PomodoroRunning) {
      emit(PomodoroPaused(duration: (state as PomodoroRunning).duration));
    }
  }

  void _onResume(ResumePomodoroEvent event, Emitter<PomodoroState> emit) {
    _tickerSubscription?.resume();
    if (state is PomodoroPaused) {
      emit(PomodoroRunning(duration: (state as PomodoroPaused).duration));
    }
  }

  void _onReset(ResetPomodoroEvent event, Emitter<PomodoroState> emit) {
    _tickerSubscription?.cancel();
    emit(PomodoroInitial(duration: duration));
  }

  void _onTick(TickPomodoroEvent event, Emitter<PomodoroState> emit) {
    final remainingDuration = event.duration;
    if (remainingDuration > Duration.zero) {
      emit(PomodoroRunning(duration: remainingDuration));
    } else {
      _tickerSubscription?.cancel();
      emit(const PomodoroComplete());
    }
  }

  void _onTickCallback(Duration remaining) {
    add(TickPomodoroEvent(duration: remaining));
  }

  @override
  Future<void> close() {
    _tickerSubscription?.dispose();
    return super.close();
  }
}
