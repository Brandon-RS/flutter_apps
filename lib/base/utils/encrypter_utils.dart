import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flit_notes/base/configs/env.dart';

class EncrypterUtils {
  static final _key = Key.fromUtf8(Env.secretKey);
  static final _b64key = Key.fromUtf8(base64Url.encode(_key.bytes).substring(0, 32));
  static final _fernet = Fernet(_b64key);
  static final _encrypter = Encrypter(_fernet);

  static String encrypt(String value) => _encrypter.encrypt(value).base64;

  static String decrypt(String value) => _encrypter.decrypt(Encrypted.fromBase64(value));
}

extension EncrypterUtilsExtension on String {
  String encrypt() => EncrypterUtils.encrypt(this);
  String decrypt() => EncrypterUtils.decrypt(this);
}
