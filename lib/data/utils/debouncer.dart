import 'dart:async';

class Debouncer {
  Timer? _timer;

  void handle(Duration duration, Function() callBack) {
    if (_timer != null) _timer!.cancel();

    _timer = Timer(duration, callBack);
  }
}
