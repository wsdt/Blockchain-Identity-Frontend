import 'package:s_frontend/controllers/RsaKeyHelper.dart';
import 'package:test/test.dart';

const String secretText = "I am an arbitrary string.";

void main() {
  test('RSA generation, encryption, decryption', () {
    var t = new RsaKeyHelper();
    var keys = t.generateKeyPair();
    var encodedPub = t.encodePublicKeyToPem(keys.publicKey);
    var encodedPriv = t.encodePrivateKeyToPem(keys.privateKey);
    print("PUB: "+encodedPub);
    print("PRIV: "+encodedPriv);

    var encryptedText = t.encrypt(secretText, keys.publicKey);
    var decryptedText = t.decrypt(encryptedText, keys.privateKey);

    expect(secretText, decryptedText);
  });
}