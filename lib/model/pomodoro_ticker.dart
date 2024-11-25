import 'dart:async';

class Ticker {
  final void Function(Duration remaining) tick;

  Timer? _timer;
  Duration? _remaining;

  Ticker({required this.tick});

  void start(Duration duration) {
    _remaining = duration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining!.inSeconds > 0) {
        _remaining = _remaining! - const Duration(seconds: 1);
        tick(_remaining!);
      } else {
        timer.cancel();
      }
    });
  }

  void pause() {
    _timer?.cancel();
  }

  void resume() {
    if (_remaining != null) {
      start(_remaining!);
    }
  }

  void cancel() {
    _timer?.cancel();
    _remaining = null;
  }

  void dispose() {
    cancel();
  }
}
