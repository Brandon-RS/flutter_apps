const undefined = Object();

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
