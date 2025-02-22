import 'package:auto_route/annotations.dart';
import 'package:flit_notes/base/constants/sdk_helpers.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/presentation/widgets/app_top_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppThemeTestPage extends StatefulWidget {
  const AppThemeTestPage({super.key});

  static const String routePath = '/app-theme-test';

  @override
  State<AppThemeTestPage> createState() => _AppThemeTestPageState();
}

class _AppThemeTestPageState extends State<AppThemeTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: 'App Theme Test Page'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Row(
              spacing: 12,
              children: [
                FilledButton(onPressed: null, child: const Text('Disabled')),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Filled Button'),
                ),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('With Icon'),
                ),
              ],
            ),
            Row(
              spacing: 12,
              children: [
                ElevatedButton(onPressed: null, child: const Text('Disabled')),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
              ],
            ),
            Row(
              spacing: 12,
              children: [
                OutlinedButton(onPressed: null, child: const Text('Disabled')),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined Button'),
                ),
              ],
            ),
            Row(
              spacing: 12,
              children: [
                TextButton(onPressed: null, child: const Text('Disabled')),
                TextButton(onPressed: () {}, child: const Text('Text Button')),
              ],
            ),
            Row(
              spacing: 12,
              children: [
                IconButton(onPressed: null, icon: const Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            ),
            Row(
              spacing: 12,
              children: icons.map((icon) => Icon(icon)).toList(),
            ),
            Row(
              spacing: 12,
              children: [
                _SimpleBox(
                  text: 'Primary Container',
                  color: context.colors.primaryContainer,
                ),
                _SimpleBox(
                  text: 'Surface Container',
                  color: context.colors.surfaceContainer,
                ),
                _SimpleBox(
                  text: 'Tertiary',
                  color: context.colors.tertiary,
                  textColor: context.colors.onTertiary,
                ),
              ],
            ),
            Row(
              spacing: 12,
              children: [
                _SimpleBox(
                  text: 'Primary Fixed',
                  color: context.colors.primaryFixed,
                  textColor: context.colors.onPrimaryFixed,
                ),
                _SimpleBox(
                  text: 'Primary Fixed Dim',
                  color: context.colors.primaryFixedDim,
                  textColor: context.colors.onPrimaryFixedVariant,
                ),
              ],
            ),
            Row(
              spacing: 12,
              children: [
                _SimpleBox(text: 'Secondary', color: context.colors.secondary),
                _SimpleBox(
                  text: 'S Container',
                  color: context.colors.secondaryContainer,
                ),
                _SimpleBox(
                  text: 'S Fixed',
                  color: context.colors.secondaryFixed,
                  textColor: context.colors.onSecondaryFixed,
                ),
              ],
            ),
            Row(
              spacing: 12,
              children: [
                _SimpleBox(
                  text: 'Error',
                  color: context.colors.error,
                  textColor: context.colors.onError,
                ),
                _SimpleBox(
                  text: 'Error Container',
                  color: context.colors.errorContainer,
                  textColor: context.colors.onErrorContainer,
                ),
              ],
            ),
            Row(
              children: [
                Switch(value: true, onChanged: (val) {}),
                Switch(value: false, onChanged: (val) {}),
              ],
            ),
            Row(
              children: [
                Checkbox(value: true, onChanged: (val) {}),
                Checkbox(value: false, onChanged: (val) {}),
              ],
            ),
            const Divider(),
            ...texts,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> get texts => [
    Text('Display Large', style: context.textTheme.displayLarge),
    Text('Display Medium', style: context.textTheme.displayMedium),
    Text('Display Small', style: context.textTheme.displaySmall),
    Text('Headline Large', style: context.textTheme.headlineLarge),
    Text('Headline Medium', style: context.textTheme.headlineMedium),
    Text('Headline Small', style: context.textTheme.headlineSmall),
    Text('Title Large', style: context.textTheme.titleLarge),
    Text('Title Medium', style: context.textTheme.titleMedium),
    Text('Title Small', style: context.textTheme.titleSmall),
    Text('Body Large', style: context.textTheme.bodyLarge),
    Text('Body Medium', style: context.textTheme.bodyMedium),
    Text('Body Small', style: context.textTheme.bodySmall),
    Text('Label Large', style: context.textTheme.labelLarge),
    Text('Label Medium', style: context.textTheme.labelMedium),
    Text('Label Small', style: context.textTheme.labelSmall),
  ];

  List<IconData> get icons => [
    Icons.add,
    Icons.search,
    Icons.menu,
    Icons.more_vert,
    Icons.more_horiz,
    Icons.arrow_back,
    Icons.arrow_forward,
  ];
}

class _SimpleBox extends StatelessWidget {
  const _SimpleBox({required this.text, required this.color, this.textColor});

  final String text;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      alignment: AlignmentDirectional.centerStart,
      height: 40.0,
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(color: textColor),
      ).addHorizontal(15),
    );
  }
}
