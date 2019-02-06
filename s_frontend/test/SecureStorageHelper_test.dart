import 'package:s_frontend/controllers/SecureStorageHelper.dart';
import 'package:test/test.dart';

const String key = "MY_KEY";
const String val = "hsj74u4iuejnjdh48huuehiikjeejkekjejhhje";
SecureStorageHelper sth = new SecureStorageHelper();

void main() {
  test('Secure storage writer, reader', () async {
    sth.write(key, val);
    expect(await sth.read(key), val);
  });

  test('Secure storage, readall', () async {
    print("RES: " + await sth.read(key));
  });
}