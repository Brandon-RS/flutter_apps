import 'package:flutter_test/flutter_test.dart';
import 'package:sdk_helpers/src/extensions/uuid_ext.dart';

void main() {
  group('uuid instance extensions', () {
    test('uuid.validateV4(str) validates a uuid v4', () {
      final str = uuid.v4();
      expect(uuid.validateV4(str), isTrue);
    });
  });
}
