import 'package:flutter/material.dart';

const undefined = Object();

// TODO(BRANDOM): Extract this helpers to a more convenient place
extension BaseObjectExt on Object {
  bool get isUndefined => this == undefined;
}

extension BaseNullableObjectExt on Object? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}

extension BaseNumExt on num {
  Duration get asMilliseconds => Duration(milliseconds: toInt());
}

extension BasePaddingExt on Widget {
  Widget addBottom(double value) =>
      Padding(padding: EdgeInsets.only(bottom: value), child: this);

  Widget addStart(double value) =>
      Padding(padding: EdgeInsetsDirectional.only(start: value), child: this);
}
