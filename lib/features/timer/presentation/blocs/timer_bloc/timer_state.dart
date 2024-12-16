part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState(this.seconds);
  final int seconds;

  Duration get duration => Duration(seconds: seconds);

  @override
  List<Object> get props => [seconds];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.seconds);

  @override
  String toString() => 'TimerInitial { duration: $seconds }';
}

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.seconds);

  @override
  String toString() => 'TimerRunPause { duration: $seconds }';
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.seconds);

  @override
  String toString() => 'TimerRunInProgress { duration: $seconds }';
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
