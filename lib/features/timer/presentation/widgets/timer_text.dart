import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/features/timer/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    required this.seconds,
    super.key,
  });

  final int seconds;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(duration: seconds)..add(TimerStarted(duration: seconds)),
      child: const _TimerText(key: Key('timer_text_key')),
    );
  }
}

class _TimerText extends StatelessWidget {
  const _TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.seconds);
    final hours = ((duration / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration % 60).toString().padLeft(2, '0');

    return Text(
      '$hours:$minutes:$seconds',
      style: context.textTheme.bodyLarge,
    );
  }
}
