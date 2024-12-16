import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/features/timer/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    required this.seconds,
    this.onTimerEnd,
    super.key,
  });

  final int seconds;
  final VoidCallback? onTimerEnd;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(duration: seconds)..add(TimerStarted(duration: seconds)),
      child: _TimerText(key: const Key('timer_text_key'), onTimerEnd: onTimerEnd),
    );
  }
}

class _TimerText extends StatelessWidget {
  const _TimerText({
    this.onTimerEnd,
    super.key,
  });

  final VoidCallback? onTimerEnd;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerBloc, TimerState>(
      listener: (context, state) => state is TimerRunComplete ? onTimerEnd?.call() : null,
      builder: (context, state) {
        final hours = ((state.seconds / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
        final minutes = ((state.seconds / 60) % 60).floor().toString().padLeft(2, '0');
        final seconds = (state.seconds % 60).toString().padLeft(2, '0');

        return Text('$hours:$minutes:$seconds', style: context.textTheme.bodyLarge);
      },
    );
  }
}
