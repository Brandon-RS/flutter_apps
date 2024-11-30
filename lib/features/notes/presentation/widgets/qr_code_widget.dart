import 'package:flutter/material.dart';
import 'package:qr/qr.dart';

class QrCodeWidget extends StatefulWidget {
  final String data;
  final double size;
  const QrCodeWidget({
    super.key,
    required this.data,
    required this.size,
  });
  @override
  State<QrCodeWidget> createState() => _QrCodeWidgetState();
}

class _QrCodeWidgetState extends State<QrCodeWidget> {
  late QrImage _qrImage;

  @override
  void initState() {
    _qrImage = QrImage(
      QrCode.fromData(
        data: widget.data,
        errorCorrectLevel: QrErrorCorrectLevel.L,
      ),
    );

    super.initState();
  }

  @override
  void didUpdateWidget(QrCodeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      _qrImage = QrImage(
        QrCode.fromData(
          data: widget.data,
          errorCorrectLevel: QrErrorCorrectLevel.L,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(widget.size),
      isComplex: false,
      willChange: false,
      painter: _QrPainter(qrImage: _qrImage),
    );
  }
}

class _QrPainter extends CustomPainter {
  const _QrPainter({
    required this.qrImage,
  });

  final QrImage qrImage;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..isAntiAlias = false;

    canvas.scale(size.height / qrImage.moduleCount);

    for (var x = 0; x < qrImage.moduleCount; x++) {
      for (var y = 0; y < qrImage.moduleCount; y++) {
        if (qrImage.isDark(y, x)) {
          canvas.drawRect(
            Rect.fromLTWH(x.toDouble(), y.toDouble(), 1, 1),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _QrPainter oldDelegate) {
    return oldDelegate.qrImage != qrImage;
  }
}
