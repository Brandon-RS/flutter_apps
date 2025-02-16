const undefined = Object();

// TODO(BRANDOM): Extract this helpers to a more convenient place
extension BaseObjectExt on Object {
  bool get isUndefined => this == undefined;
}

extension BaseNumExt on num {
  Duration get asMilliseconds => Duration(milliseconds: toInt());
}
