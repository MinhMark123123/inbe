import 'dart:convert';

import 'package:aac_core/aac_core.dart';
// import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  Future<String> get(String key) async {
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
    return await _secureStorage?.clear();
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

  Future<void> setFirstLaunch(String isFirst) async {
    return await set(PrefKeys.keyFirstLaunch, isFirst);
  }

  Future<bool> getFirstLaunch() async {
    String isFirst = await get(PrefKeys.keyFirstLaunch);
    print("ttt isFirst = $isFirst");
    return isFirst.isEmpty;
  }

  Future<void> setFCMToken(String? fcmToken) async {
    return await setSecure(SecureKeys.keyFCMToken, fcmToken);
  }

  Future<String> getFCMToken() async {
    return await getSecure(SecureKeys.keyFCMToken);
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

  Future<void> setListCategory(List<String> values) async {
    var encode = jsonEncode(values);
    return await setSecure(SecureKeys.keyListCategory, encode);
  }

  Future<List<String>> getListCategory() async {
    var value = await getSecure(SecureKeys.keyListCategory);
    return jsonDecode(value);
  }

  Future<List<String>> getListCategoryJson() async {
    var value = await getSecure(SecureKeys.keyListCategory);
    if (value.isNotEmpty) {
      var data = jsonDecode(value);
      return List<String>.from(data);
    } else {
      return [];
    }
  }
}
