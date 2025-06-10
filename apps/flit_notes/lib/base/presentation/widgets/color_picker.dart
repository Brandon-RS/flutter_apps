import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({required this.onColorSelected, this.selected, super.key});

  final ValueChanged<Color> onColorSelected;
  final Color? selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        ...colors.map(
          (color) => _ColorItem(
            key: Key('Colors.${color.toARGB32()}'),
            color: color,
            selected: selected == color,
            onTap: () => onColorSelected(color),
          ),
        ),
      ],
    );
  }

  List<Color> get colors => [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
}

class _ColorItem extends StatelessWidget {
  const _ColorItem({
    required this.color,
    this.selected = false,
    this.onTap,
    super.key,
  });

  final Color color;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 30,
        height: 30,
        child: ClipOval(
          child: ColoredBox(
            color: color,
            child:
                selected ? const Icon(Icons.check, color: Colors.white) : null,
          ),
        ),
      ),
    );
  }
}
