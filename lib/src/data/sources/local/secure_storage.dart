part of 'key_data_source.dart';

class _SecureStorage {

  FlutterSecureStorage? _secureS;

  static final _SecureStorage _singleton = _SecureStorage._();

  factory _SecureStorage() {
    return _singleton;
  }

  _SecureStorage._() {
    if (_secureS == null) {
      _init();
    }
  }

  _init() async {
    _secureS = const FlutterSecureStorage();
  }

  Future<String?> get(String key) async {
    return await _secureS?.read(key: key);
  }

  Future<void> put(String key, String value) async {
    return await _secureS?.write(key: key, value: value);
  }

  Future<void> remove(String key) async {
    return await _secureS?.delete(key: key);
  }

  Future<void> clear() async {
    return await _secureS?.deleteAll();
  }



  // Future<String?> get(String key) async {
  //   return await FlutterKeychain.get(key: key);
  // }
  //
  // Future<void> put(String key, String value) async {
  //   return await FlutterKeychain.put(key: key, value: value);
  // }
  //
  // Future<void> remove(String key) async {
  //   return await FlutterKeychain.remove(key: key);
  // }
  //
  // Future<void> clear() async {
  //   return await FlutterKeychain.clear();
  // }
}
