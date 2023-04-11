import 'dart:convert';
import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:intl/intl.dart';
import 'package:prayaas_loans/services/util/tg_flavor.dart';
import 'package:webcrypto/webcrypto.dart';

import 'encdec/encrypt.dart';

RSAPublicKey getpublicKey(String b64) {
  final pem = '-----BEGIN RSA PUBLIC KEY-----\n$b64\n-----END RSA PUBLIC KEY-----';
  return CryptoUtils.rsaPublicKeyFromPem(pem);
}

RSAPrivateKey getPrivateKey(String b64) {
  final pem = '-----BEGIN RSA PRIVATE KEY-----\n$b64\n-----END RSA PRIVATE KEY-----';
  return CryptoUtils.rsaPrivateKeyFromPem(pem);
}

String decryptByPrivatekey(String? content) {
  var publicKey_ = getpublicKey(TGFlavor.param("publickey"));
  var privateKey_ = getPrivateKey(TGFlavor.param("privatekey"));

  Encrypter encrypter = Encrypter(RSA(publicKey: publicKey_, privateKey: privateKey_));
  String decrypted = encrypter.decrypt(Encrypted.fromBase64(content!));
  print(decrypted);

  return decrypted;
}

String encryptbypublicekey(String content) {
  var publicKey_ = getpublicKey(TGFlavor.param("publickey"));
  var privateKey_ = getPrivateKey(TGFlavor.param("privatekey"));

  Encrypter encrypter = Encrypter(RSA(publicKey: publicKey_, privateKey: privateKey_));

  var decrypted = encrypter.encrypt(content).base64;

  return decrypted;
}

Future<String> getCurrentTimeStemp() async {
  DateFormat dateFormat = DateFormat("dd-MM-yyyy HH:mm:ss");
  return dateFormat.format(DateTime.now());
}

Future<String> encryptAES(String message, String key, String iv) async {
  var aesGcmSecretKey = await AesGcmSecretKey.importRawKey(utf8.encode(key));
  var content = utf8.encode(message);
  var t = iv?.substring(0, 16);
  var iv_ = utf8.encode(t!);
  Uint8List encryptedBytes = await aesGcmSecretKey.encryptBytes(content, iv_);
  var base64 = base64Encode(encryptedBytes);

  return base64;
}

Future<String> decryptAES(String? message, String? key, String? iv) async {
  var aesGcmSecretKey = await AesGcmSecretKey.importRawKey(utf8.encode(key!));
  var content = base64Decode(message!);
  var t = iv?.substring(0, 16);
  var iv_ = utf8.encode(t!);
  Uint8List encryptedBytes = await aesGcmSecretKey.decryptBytes(content, iv_);
  String decryptdString = String.fromCharCodes(encryptedBytes);

  return decryptdString;
}

// var public = CryptoUtils.rsaPublicKeyFromPem(pem);

//var encryptedRSAkey = encryptbypublicekey(str2);

//print("encryptedRSAkey $encryptedRSAkey");

//var decrryptKEy = decryptByPrivatekey(secID);

//var decryptedkey= utf8.decode(base64Decode(decrryptKEy));

// var decrryptKEy_2 = utf8.encode(decrryptKEy_);

//var response= utf8.decode(base64.decode(payload));

//print(decryptedkey);
//print(str2);

// Uint8List ivCiphertextMac = base64.decode(payload); // from the Java code
// Uint8List iv = base64.decode("30-09-2022 04:49:13".substring(0,16));
// Uint8List ciphertext  = ivCiphertextMac.sublist(12, ivCiphertextMac.length - 16);
// Uint8List mac = ivCiphertextMac.sublist(ivCiphertextMac.length - 16);
//
// Uint8List passphrase = base64.decode(decrryptKEy_);
// SecretKey secretKey = new SecretKey(passphrase);
//
// SecretBox secretBox = SecretBox(ciphertext, nonce: iv, mac: new MaCTest.Mac(mac));
//
// List<int> decrypted = await AesGcm.with256bits().decrypt(secretBox, secretKey: secretKey);
// String dec = utf8.decode(decrypted);
//
// print("dec : " + dec);

// final decrypter = Encrypter(AES(Key.fromBase64(decrryptKEy_)));

// final decrypted = decrypter.decrypt(Encrypted.fromBase64(payload), iv: IV.fromUtf8("30-09-2022 04:49:13".substring(0,16)));
// print(encryptedRSAkey);

// final iv = IV.fromSecureRandom(16);
// final encrypter = Encrypter(AES(Key.fromBase64(str2)));

//final encrypted = encrypter.encrypt(plainText, iv: iv);

// print(encrypted.base64);

//  final decrypted = encrypter.decrypt(encrypted, iv: iv);

// var aesEncryptedReq=()

// encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privKey, encoding: RSAEncoding.PKCS1));
//  encrypted = encrypter.encrypt(plainText);
//  decrypted = encrypter.decrypt(encrypted) ;

//print('PKCS1 (Default)');
//  print(decrypted);

//print(encrypted.base64);

// String encryprtAES(String plainText, String key_, String iv_) {
//   final key = Key.fromUtf8(key_);
//   final iv = IV.fromUtf8(iv_.substring(0, 16));
//
//   final encrypter = Encrypter(AES(key, mode: AESMode.gcm));
//
//   final encrypted = encrypter.encrypt(plainText, iv: iv);
//
//   print("encryprtAES   " + encrypted.base64);
//
//   return encrypted.base64;
// }
//
// String decrypteAES(String? payload, String? iv_, String? timeStemp) {
//   final key = Key.fromUtf8(iv_!);
//   final iv = IV.fromUtf8(timeStemp!.substring(0, 16));
//   final encrypter = Encrypter(AES(key, mode: AESMode.gcm));
//   final decrypted = encrypter.decrypt(Encrypted.fromBase64(payload!), iv: iv);
//
//   return decrypted;
// }

//var timestemp=getCurrentTimeStemp();

//encryprtAES("test",uuid,timestemp);

// decrypteAES(payload, decryptedkey, "12-10-2022 05:38:57");
