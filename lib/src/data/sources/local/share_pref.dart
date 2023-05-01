import 'package:aac_core/aac_core.dart';

class SharePref{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // static final SharePref _singleton = SharePref._();
  //
  // factory SharePref() {
  //   return _singleton;
  // }
  //
  // SharePref._() {
  //   if (_prefs == null) {
  //     _init();
  //   }
  // }
  //
  // _init() {
  //   _prefs = SharedPreferences.getInstance();
  // }

  Future<bool?> set(String key, String? value) async {
    SharedPreferences preferences = await _prefs;
    return await preferences.setString(key, value ?? '');
  }

  Future<String?> get(String key) async {
    SharedPreferences preferences = await _prefs;
    return preferences.getString(key);
  }

  // String get(String key) => _prefs?.getString(key) ?? '';
  //
  // Future<bool?> setBool(String key, bool? value) async {
  //   SharedPreferences preferences = await _prefs;
  //   return await preferences.setBool(key, value ?? false);
  // }
  //
  // bool getBool(String key) => _prefs?.getBool(key) ?? false;
  //
  // Future<bool?> remove(String key) async {
  //   return await _prefs?.remove(key);
  // }
  //
  // Future<bool?> clear() async {
  //   return await _prefs?.clear();
  // }
}
