part of 'key_data_source.dart';

class _SecureStorage {
  Future<String?> get(String key) async {
    return await FlutterKeychain.get(key: key);
  }

  Future<void> put(String key, String value) async {
    return await FlutterKeychain.put(key: key, value: value);
  }

  Future<void> remove(String key) async {
    return await FlutterKeychain.remove(key: key);
  }

  Future<void> clear() async {
    return await FlutterKeychain.clear();
  }
}
