import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:s_frontend/controllers/RsaKeyHelper.constants.dart';
import 'package:s_frontend/controllers/RsaKeyHelper.dart';

/// https://pub.dartlang.org/packages/flutter_secure_storage
/// A Flutter plugin to store data in secure storage:
///    Keychain is used for iOS
///    AES encryption is used for Android. AES secret key is encrypted with RSA and RSA key is stored in KeyStore

///    Note KeyStore was introduced in Android 4.3 (API level 18). The plugin wouldn't work for earlier versions.
///    ==> For that reason android/app/build.gradle minSdkVersion has been set to >=18

final _storage = new FlutterSecureStorage();


class SecureStorageHelper {

  void write(String key, String val) async {
    await _storage.write(key:key, value:val);
  }

  Future<String> read(String key) async {
    return await _storage.read(key: key);
  }

  void delete(String key) async {
    await _storage.delete(key: key);
  }

  void deleteAll() async {
    await _storage.deleteAll();
  }

  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }

  // CUSTOM Helper methods
  void savePrivPubKeyPair(AsymmetricKeyPair<PublicKey, PrivateKey> keyPair) {
    write(SECSTOR_ID_PUBKEY, RsaKeyHelper.encodePublicKeyToPem(keyPair.publicKey));
    write(SECSTOR_ID_PRIVKEY, RsaKeyHelper.encodePrivateKeyToPem(keyPair.privateKey));
  }

  Future<String> getPubKey() {
    return read(SECSTOR_ID_PUBKEY);
  }

  Future<String> getPrivKey() {
    return read(SECSTOR_ID_PRIVKEY);
  }
}
