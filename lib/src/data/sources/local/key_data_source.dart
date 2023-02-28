import 'package:aac_core/aac_core.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:inabe/src/data/constants/constants.dart';

part 'pref_storage.dart';

part 'secure_storage.dart';

class KeyDataSource {
  _PrefStorage? _prefStorage;
  _SecureStorage? _secureStorage;

  static final KeyDataSource _singleton = KeyDataSource._();

  factory KeyDataSource() {
    return _singleton;
  }

  KeyDataSource._() {
    if (_prefStorage == null || _secureStorage == null) {
      _init();
    }
  }

  _init() async {
    _prefStorage = _PrefStorage();
    _secureStorage = _SecureStorage();
  }

  Future<void> set(String key, String? value) async {
    print('KeyDataSource ---- set: $key $value');
    await _prefStorage?.set(key, value) ?? false;
  }

  String get(String key) {
    return _prefStorage?.get(key) ?? '';
  }

  Future<void> setBool(String key, bool? value) async {
    print('KeyDataSource ---- setBool: $key $value');
    await _prefStorage?.setBool(key, value) ?? false;
  }

  bool getBool(String key, {bool df = false}) {
    return _prefStorage?.getBool(key) ?? df;
  }

  Future<void> delete(String key) async {
    print('KeyDataSource ---- delete $key');
    await _prefStorage?.remove(key);
    await _secureStorage?.remove(key);
  }

  Future<void> clear() async {
    print('KeyDataSource ---- clear');
    await _prefStorage?.clear();
    await _secureStorage?.clear();
  }

  Future<void> clearUserInfo() async {
    print('KeyDataSource ---- clearUserInfo');
    await _prefStorage?.remove(PrefKeys.keyPhone);
    await _prefStorage?.remove(PrefKeys.keyFormattedPhone);
    await _secureStorage?.clear();
  }

  Future<void> setSecure(String key, String? value) async {
    return await _secureStorage?.put(key, value ?? '');
  }

  Future<String> getSecure(String key) async {
    return await _secureStorage?.get(key) ?? '';
  }

  Future<void> setToken(String? token) async {
    return await setSecure(SecureKeys.keyToken, token);
  }

  Future<String> getToken() async {
    return await getSecure(SecureKeys.keyToken);
  }

  Future<void> setRefreshToken(String? refreshToken) async {
    return await setSecure(SecureKeys.keyRefreshToken, refreshToken);
  }

  Future<String> getRefreshToken() async {
    return await getSecure(SecureKeys.keyRefreshToken);
  }

  Future<void> setLoginUser(String? user) async {
    return await setSecure(SecureKeys.keyLoginUser, user);
  }

  Future<String> getLoginUser() async {
    return await getSecure(SecureKeys.keyLoginUser);
  }

  Future<void> setLoginPassword(String? password) async {
    return await setSecure(SecureKeys.keyLoginPassword, password);
  }

  Future<String> getLoginPassword() async {
    return await getSecure(SecureKeys.keyLoginPassword);
  }
}