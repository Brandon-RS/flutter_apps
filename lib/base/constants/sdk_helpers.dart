import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const undefined = Object();

const uuid = Uuid();

extension UuidExt on Uuid {
  /// Validates a UUID v4.
  bool validateV4(String uuid) {
    final regex = RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
      caseSensitive: false,
    );

    return regex.hasMatch(uuid);
  }

  /// Generates a UUID v4 and validates it, if it's invalid, it will generate another one.
  /// - It will throw an exception after 4 failed attempts.
  String safeV4() {
    String uuid;
    int attempts = 0;

    do {
      uuid = v4();
      attempts++;
      log('UUID: $uuid, attempt: $attempts', name: 'safeV4');
    } while (!validateV4(uuid) && attempts < 4);

    return uuid;
  }
}

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
  Widget addTop(double value) =>
      Padding(padding: EdgeInsets.only(top: value), child: this);

  Widget addBottom(double value) =>
      Padding(padding: EdgeInsets.only(bottom: value), child: this);

  Widget addStart(double value) =>
      Padding(padding: EdgeInsetsDirectional.only(start: value), child: this);

  Widget addEnd(double value) =>
      Padding(padding: EdgeInsetsDirectional.only(end: value), child: this);

  Widget addHorizontal(double value) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this);
}
