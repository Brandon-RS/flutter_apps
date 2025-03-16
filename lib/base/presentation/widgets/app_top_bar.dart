import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/blocs/app_bloc/app_bloc.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  AppTopBar({
    this.title,
    this.toolbarHeight,
    this.bottom,
    this.actions,
    this.leading,
    super.key,
  }) : preferredSize = _PreferredTopBarSize(
         toolbarHeight,
         bottom?.preferredSize.height,
       );

  final String? title;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  @override
  final Size preferredSize;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ?? const AutoLeadingButton(),
      title: Text(title ?? context.localizations.appName),
      bottom: bottom,
      actions:
          actions ??
          [
            IconButton(
              icon: const Icon(Icons.brightness_4),
              onPressed:
                  () => context.read<AppBloc>().add(const ToggleAppTheme()),
            ),
          ],
    );
  }
}

class _PreferredTopBarSize extends Size {
  const _PreferredTopBarSize(this.toolbarHeight, this.bottomHeight)
    : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
