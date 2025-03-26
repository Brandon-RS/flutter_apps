import 'package:flutter_test/flutter_test.dart';
import 'package:sdk_helpers/src/extensions/extensions.dart';

void main() {
  group('undefined object', () {
    test('`isUndefined`', () {
      expect(undefined.isUndefined, isTrue);
    });
  });

  group('nullable object extension', () {
    test('`isNull`', () {
      Object? obj;
      expect(obj.isNull, isTrue);
    });

    test('`isNotNull`', () {
      Object? obj = Object();
      expect(obj.isNotNull, isTrue);
    });
  });

  group('num extension', () {
    test('`asMilliseconds`', () {
      final num value = 1000;
      expect(value.asMilliseconds, Duration(milliseconds: 1000));
    });
  });
}
