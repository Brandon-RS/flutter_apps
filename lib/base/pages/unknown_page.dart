import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/base/widgets/plugs.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.localizations.four_o_four, style: context.textTheme.displayLarge),
              const SizedBox(height: 10),
              Text(context.localizations.page_not_found, style: context.textTheme.headlineSmall),
              const SizedBox(height: 40),
              ConstrainedBox(constraints: const BoxConstraints(maxWidth: 900), child: const Plugs()),
              const SizedBox(height: 40),
              Text(
                context.localizations.page_not_found_message,
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                context.localizations.like_create_note,
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () => context.router.replaceAll([const HomeRoute()]),
                child: Text(context.localizations.go_for_it),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
