import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/blocs/app_bottom_bar_cubit/app_bottom_bar_cubit.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: context.colors.primary,
      padding: EdgeInsets.zero,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomAction(icon: Icons.window, path: '/', index: 0),
          _BottomAction(icon: Icons.search, path: '/find', index: 1),
          _BottomAction(icon: Icons.settings, path: '/settings', index: 2),
        ],
      ),
    );
  }
}

class _BottomAction extends StatelessWidget {
  const _BottomAction({
    required this.path,
    required this.icon,
    required this.index,
  });

  final String path;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<AppBottomBarCubit, AppBottomBarState>(
          builder: (context, state) {
            final color =
                index == state.currentIndex
                    ? context.colors.primaryFixed
                    : context.colors.outlineVariant;

            return Icon(icon, size: 30, color: color);
          },
        ),
      ),
      onTap: () {
        context.navigateToPath(path);
        context.read<AppBottomBarCubit>().onPageChanged(index);
      },
    );
  }
}
