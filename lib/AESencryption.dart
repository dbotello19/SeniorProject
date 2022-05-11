import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';

class MyEncryptionDecryption {
  //AES Encryption/Decryption
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));
  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }


  static String decryptAES(String base64Text) {
  String decrypted = encrypter.decrypt(Encrypted.fromBase64(base64Text), iv: iv);
  return decrypted;
}
}
