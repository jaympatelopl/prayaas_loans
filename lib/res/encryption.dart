// import 'dart:convert' as ConvertPack;
//
// import 'package:crypto/crypto.dart' as CryptoPack;
// import 'package:encrypt/encrypt.dart' as EncryptPack;

import 'dart:math';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:prayaas_loans/services/common/tg_log.dart';
import 'package:tuple/tuple.dart';

import '../config/api_config.dart';

class EncryptionData {
  static String stringData = "";

  // String encryption
  static String encryptKey({String str = ""}) {
    // try {
    //   final salt = genRandomWithNonZero(8);
    //   var keyndIV = deriveKeyAndIV(APIConfig.secretKey, salt);
    //   final key = encrypt.Key(keyndIV.item1);
    //   final iv = encrypt.IV(keyndIV.item2);
    //
    //   final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: "PKCS7"));
    //   final encrypted = encrypter.encrypt(str, iv: iv);
    //   Uint8List encryptedBytesWithSalt = Uint8List.fromList(
    //       createUint8ListFromString((APIConfig.secretKey).substring(0, 16)) + salt + encrypted.bytes);
    //   return base64.encode(encryptedBytesWithSalt);
    // } catch (error) {
    //   throw error;
    // }
    // Final Block
    final secretKey = Key.fromBase64(APIConfig.secretKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(secretKey, mode: AESMode.ecb));
    var encryptedText = encrypter.encrypt(str, iv: iv);
    TGLog.d('Encrypted data---------${encryptedText.base64}');
    // final decrypted = encrypter.decrypt(encryptedText, iv: iv);
    // TGLog.d('Dencrypted data---------${decrypted}');
    return encryptedText.base64;

    // try {
    //   final cryptor = PlatformStringCryptor();
    //   // final password = key;
    //   // final String salt = await cryptor.generateSalt();
    //   // final String keyS = await cryptor.generateKeyFromPassword(password, salt);
    //   final String encrypted = await cryptor.encrypt(key, APIConfig.secretKey);
    //   TGLog.d('Encrypted data---------${encrypted}');
    //
    //   return encrypted;
    // } catch (error) {
    //   TGLog.d('Error in Encrypted data------------------------${error.toString()}');
    //   return "";
    // }
    // final keyS = Key.fromUtf8(APIConfig.secretKey);
    // final keyBytes = base64Encode(Uint8List.fromList(APIConfig.secretKey.codeUnits).sublist(0, 16));
    // final encrypter = Encrypter(AES(keyS, mode: AESMode.ecb));
    //
    // final encrypted = encrypter.encrypt(base64Encode(hex.decode(str)), iv: IV.fromBase64(keyBytes));
    // TGLog.d('Encrypted data---------${encrypted.base64}');
    // return encrypted.base64;

    // String strPwd = APIConfig.secretKey;
    // String strIv = APIConfig.secretKey.substring(0, 16);
    // var iv = CryptoPack.sha256
    //     .convert(ConvertPack.utf8.encode(strIv))
    //     .toString()
    //     .substring(0, 16); // Consider the first 16 bytes of all 64 bytes
    // var key = CryptoPack.sha256
    //     .convert(ConvertPack.utf8.encode(strPwd))
    //     .toString()
    //     .substring(0, 32); // Consider the first 32 bytes of all 64 bytes
    // EncryptPack.IV ivObj = EncryptPack.IV.fromUtf8(iv);
    // EncryptPack.Key keyObj = EncryptPack.Key.fromUtf8(key);
    // final encrypter = EncryptPack.Encrypter(EncryptPack.AES(keyObj, mode: EncryptPack.AESMode.cbc)); // Apply CBC mode
    // // String firstBase64Decoding = new String.fromCharCodes(ConvertPack.base64.decode(str)); // First Base64 decoding
    // // final decrypted = encrypter.decrypt(EncryptPack.Encrypted.fromBase64(firstBase64Decoding),
    // //     iv: ivObj); // Second Base64 decoding (during decryption)
    // TGLog.d('Encrypted data---------${encrypter.encrypt(str, iv: ivObj).base64}');
    // return encrypter.encrypt(str, iv: ivObj).base64;
    // var pem = '-----BEGIN RSA PUBLIC KEY-----\n${APIConfig.secretKey}\n-----END RSA PUBLIC KEY-----';
    // var public = CryptoUtils.rsaPublicKeyFromPem(pem);
    //
    // /// Initalizing Cipher
    // var cipher = PKCS1Encoding(RSAEngine());
    // cipher.init(true, PublicKeyParameter<RSAPublicKey>(public));
    //
    // /// Converting into a [Unit8List] from List<int>
    // /// Then Encoding into Base64
    // Uint8List output = cipher.process(Uint8List.fromList(utf8.encode(key)));
    // var base64EncodedText = base64Encode(output);
    // return base64EncodedText;

    // final cipherKey = Key.fromUtf8(APIConfig.secretKey);
    // final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    // final initVector = IV.fromUtf8(APIConfig.secretKey.substring(0,
    //     16)); //Here the IV is generated from key. This is for example only. Use some other text or random data as IV for better security.
    //
    // Encrypted encryptedData = encryptService.encrypt(key, iv: initVector);
    // TGLog.d('Encrypted data---------${encryptedData.base64}');
    //
    // return encryptedData.toString();

//     final iv = IV.fromLength(16);
//
//     final b64key = Key.fromBase64(APIConfig.secretKey);
// // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
//     final fernet = Fernet(b64key);
//     final encrypter = Encrypter(fernet);
//
//     final encrypted = encrypter.encrypt(key);
//     final decrypted = encrypter.decrypt(encrypted);
//
//     print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
//     print('Encrypted data--------"${encrypted.base64}"'); // random cipher text
//     // print(fernet.extractTimestamp(encrypted.bytes)); //
//     return encrypted.base64; // unix timestamp
  }

// String encrypt(String plaintext, String publicKey) {
//   /// After a lot of research on how to convert the public key [String] to [RSA PUBLIC KEY]
//   /// We would have to use PEM Cert Type and the convert it from a PEM to an RSA PUBLIC KEY through basic_utils
//   var pem = '-----BEGIN RSA PUBLIC KEY-----\n${APIConfig.secretKey}\n-----END RSA PUBLIC KEY-----';
//   var public = CryptoUtils.rsaPublicKeyFromPem(pem);
//
//   /// Initalizing Cipher
//   var cipher = PKCS1Encoding(RSAEngine());
//   cipher.init(true, PublicKeyParameter<RSAPublicKey>(public));
//
//   /// Converting into a [Unit8List] from List<int>
//   /// Then Encoding into Base64
//   Uint8List output = cipher.process(Uint8List.fromList(utf8.encode(plaintext)));
//   var base64EncodedText = base64Encode(output);
//   return base64EncodedText;
// }

  ///Encrypts the given plainText using the key. Returns encrypted data
// static String encryptWithAES(String key, String plainText) {
//   final cipherKey = Key.fromUtf8(APIConfig.secretKey);
//   final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
//   final initVector = IV.fromUtf8(APIConfig.secretKey.substring(0,
//       16)); //Here the IV is generated from key. This is for example only. Use some other text or random data as IV for better security.
//
//   Encrypted encryptedData = encryptService.encrypt(plainText, iv: initVector);
//   return encryptedData.base64;
// }

  // static String encryptAESCryptoJS({String key = ''}) {
  //   final secretKey = Key.fromUtf8(APIConfig.secretKey);
  //   final iv = IV.fromLength(8);
  //   final encrypter = Encrypter(Salsa20(secretKey));
  //
  //   final encrypted = encrypter.encrypt(key, iv: iv);
  //   TGLog.d('Encrypted data---------${encrypted.base64}');
  //   // final decrypted = encrypter.decrypt(encrypted, iv: iv);
  //   // print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  //   print(encrypted.base64);
  //
  //   return encrypted.base64;
  // }

  // String encryptAESCryptoJS(String plainText, String passphrase) {
  //   try {
  //     final salt = genRandomWithNonZero(8);
  //     var keyndIV = deriveKeyAndIV(passphrase, salt);
  //     final key = encrypt.Key(keyndIV.item1);
  //     final iv = encrypt.IV(keyndIV.item2);
  //
  //     final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: "PKCS7"));
  //     final encrypted = encrypter.encrypt(plainText, iv: iv);
  //     Uint8List encryptedBytesWithSalt =
  //         Uint8List.fromList(createUint8ListFromString("Salted__") + salt + encrypted.bytes);
  //     return base64.encode(encryptedBytesWithSalt);
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  static Uint8List createUint8ListFromString(String s) {
    var ret = new Uint8List(s.length);
    for (var i = 0; i < s.length; i++) {
      ret[i] = s.codeUnitAt(i);
    }
    return ret;
  }

  static Uint8List genRandomWithNonZero(int seedLength) {
    final random = Random.secure();
    const int randomMax = 245;
    final Uint8List uint8list = Uint8List(seedLength);
    for (int i = 0; i < seedLength; i++) {
      uint8list[i] = random.nextInt(randomMax) + 1;
    }
    return uint8list;
  }

  static Tuple2<Uint8List, Uint8List> deriveKeyAndIV(String passphrase, Uint8List salt) {
    var password = createUint8ListFromString(passphrase);
    Uint8List concatenatedHashes = Uint8List(0);
    Uint8List currentHash = Uint8List(0);
    bool enoughBytesForKey = false;
    Uint8List preHash = Uint8List(0);

    while (!enoughBytesForKey) {
      int preHashLength = currentHash.length + password.length + salt.length;
      if (currentHash.length > 0)
        preHash = Uint8List.fromList(currentHash + password + salt);
      else
        preHash = Uint8List.fromList(password + salt);

      // currentHash = md5.convert(preHash).bytes;
      concatenatedHashes = Uint8List.fromList(concatenatedHashes + currentHash);
      if (concatenatedHashes.length >= 48) enoughBytesForKey = true;
    }

    var keyBtyes = concatenatedHashes.sublist(0, 32);
    var ivBtyes = concatenatedHashes.sublist(32, 48);
    return new Tuple2(keyBtyes, ivBtyes);
  }

// String encryptAESCryptoJS(String plainText, String passphrase) {
//   try {
//     final salt = genRandomWithNonZero(8);
//     var keyndIV = deriveKeyAndIV(passphrase, salt);
//     final key = encrypt.Key(keyndIV.item1);
//     final iv = encrypt.IV(keyndIV.item2);
//
//     final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: "PKCS7"));
//     final encrypted = encrypter.encrypt(plainText, iv: iv);
//     Uint8List encryptedBytesWithSalt =
//         Uint8List.fromList(createUint8ListFromString("Salted__") + salt + encrypted.bytes);
//     return base64.encode(encryptedBytesWithSalt);
//   } catch (error) {
//     throw error;
//   }
// }
//
// Tuple2<Uint8List, Uint8List> deriveKeyAndIV(String passphrase, Uint8List salt) {
//   var password = createUint8ListFromString(passphrase);
//   Uint8List concatenatedHashes = Uint8List(0);
//   Uint8List currentHash = Uint8List(0);
//   bool enoughBytesForKey = false;
//   Uint8List preHash = Uint8List(0);
//
//   while (!enoughBytesForKey) {
//     int preHashLength = currentHash.length + password.length + salt.length;
//     if (currentHash.length > 0)
//       preHash = Uint8List.fromList(currentHash + password + salt);
//     else
//       preHash = Uint8List.fromList(password + salt);
//
//     currentHash = md5.convert(preHash).bytes;
//     concatenatedHashes = Uint8List.fromList(concatenatedHashes + currentHash);
//     if (concatenatedHashes.length >= 48) enoughBytesForKey = true;
//   }
//
//   var keyBtyes = concatenatedHashes.sublist(0, 32);
//   var ivBtyes = concatenatedHashes.sublist(32, 48);
//   return new Tuple2(keyBtyes, ivBtyes);
// }
//
// Uint8List createUint8ListFromString(String s) {
//   var ret = new Uint8List(s.length);
//   for (var i = 0; i < s.length; i++) {
//     ret[i] = s.codeUnitAt(i);
//   }
//   return ret;
// }
//
// Uint8List genRandomWithNonZero(int seedLength) {
//   final random = Random.secure();
//   const int randomMax = 245;
//   final Uint8List uint8list = Uint8List(seedLength);
//   for (int i = 0; i < seedLength; i++) {
//     uint8list[i] = random.nextInt(randomMax) + 1;
//   }
//   return uint8list;
// }

// String decryption
// static String decryptAES(Encrypted str) {
//   final key = Key.fromUtf8(APIConfig.secretKey);
//   final iv = IV.fromLength(16);
//   final encrypter = Encrypter(AES(key, mode: AESMode.cfb64));
//   final decrypted = encrypter.decrypt(str, iv: iv);
//   // final decrypted =  encrypter.decrypt64(base64Encode(hex.decode(encryptedText)), iv: IV.fromBase64(iv))
//   // final keyS = Key.fromUtf8(APIConfig.secretKey);
//   // final keyBytes = base64Encode(Uint8List.fromList(APIConfig.secretKey.codeUnits).sublist(0, 16));
//   // final encrypter = Encrypter(AES(keyS, mode: AESMode.ecb));
//   //
//   // final decrypted = encrypter.decrypt64(base64Encode(hex.decode(str)), iv: IV.fromBase64(keyBytes));
//   TGLog.d('Dencrypted data---------${decrypted}');
//
//   return decrypted;
// }
}
