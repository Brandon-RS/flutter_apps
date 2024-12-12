import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/features/timer/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    required this.duration,
    super.key,
  });

  final int duration;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(duration: duration)..add(TimerStarted(duration: duration)),
      child: const _TimerText(key: Key('timer_text_key')),
    );
  }
}

class _TimerText extends StatelessWidget {
  const _TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(BRANDOM): Maybe the duration property as a Duration instead of int
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final hoursStr = ((duration / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
    final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).toString().padLeft(2, '0');

    return Text(
      '$hoursStr:$minutesStr:$secondsStr',
      style: context.textTheme.bodyLarge,
    );
  }
}
