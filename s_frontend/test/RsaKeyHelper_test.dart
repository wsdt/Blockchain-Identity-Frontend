import 'package:s_frontend/controllers/RsaKeyHelper.dart';
import 'package:test/test.dart';

const String secretText = "I am an arbitrary string.";

void main() {
  test('RSA generation, encryption, decryption', () {
    var keys = RsaKeyHelper.generateKeyPair();
    var encodedPub = RsaKeyHelper.encodePublicKeyToPem(keys.publicKey);
    var encodedPriv = RsaKeyHelper.encodePrivateKeyToPem(keys.privateKey);
    print("PUB: "+encodedPub);
    print("PRIV: "+encodedPriv);

    var encryptedText = RsaKeyHelper.encrypt(secretText, keys.publicKey);
    var decryptedText = RsaKeyHelper.decrypt(encryptedText, keys.privateKey);

    expect(secretText, decryptedText);
  });
}