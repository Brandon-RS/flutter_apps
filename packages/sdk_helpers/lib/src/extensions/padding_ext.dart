import 'package:flutter/material.dart';

extension BasePaddingExt on Widget {
  Widget addTop(double value) => Padding(padding: EdgeInsets.only(top: value), child: this);

  Widget addBottom(double value) => Padding(padding: EdgeInsets.only(bottom: value), child: this);

  Widget addStart(double value) => Padding(padding: EdgeInsetsDirectional.only(start: value), child: this);

  Widget addEnd(double value) => Padding(padding: EdgeInsetsDirectional.only(end: value), child: this);

  Widget addHorizontal(double value) => Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this);

  Widget addVertical(double value) => Padding(padding: EdgeInsets.symmetric(vertical: value), child: this);

  Widget addAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);
}
