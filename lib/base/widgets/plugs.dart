import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class Plugs extends StatelessWidget {
  const Plugs({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: _WiredPlug(main: true)),
          SizedBox(width: constraints.maxWidth * 0.1),
          const Expanded(child: RotatedBox(quarterTurns: 2, child: _WiredPlug())),
        ],
      ),
    );
  }
}

class _WiredPlug extends StatelessWidget {
  const _WiredPlug({this.main = false});

  final bool main;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(10);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: _Box(topLeft: radius, bottomLeft: radius)),
            const _Box(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6), width: 20, height: 20),
            const _Box(topLeft: radius, bottomLeft: radius, width: 40, height: 60),
            const _Box(topLeft: radius, bottomLeft: radius, bottomRight: radius, topRight: radius, width: 8, height: 80),
            if (main)
              const Column(
                children: [
                  _Box(topRight: radius, bottomRight: radius),
                  SizedBox(height: 20),
                  _Box(topRight: radius, bottomRight: radius),
                ],
              ),
          ],
        );
      },
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({
    this.topLeft = Radius.zero,
    this.topRight = Radius.zero,
    this.bottomLeft = Radius.zero,
    this.bottomRight = Radius.zero,
    this.width = 30.0,
    this.height = 8.0,
  });

  final Radius topLeft;
  final Radius topRight;
  final Radius bottomLeft;
  final Radius bottomRight;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: context.theme.primaryColor,
      borderRadius: BorderRadius.only(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      ),
    );

    return Container(decoration: decoration, width: width, height: height);
  }
}
