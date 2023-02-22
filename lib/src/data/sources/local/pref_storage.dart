part of 'key_data_source.dart';

class _PrefStorage {
  SharedPreferences? _prefs;

  static final _PrefStorage _singleton = _PrefStorage._();

  factory _PrefStorage() {
    return _singleton;
  }

  _PrefStorage._() {
    if (_prefs == null) {
      _init();
    }
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> set(String key, String? value) async {
    return await _prefs?.setString(key, value ?? '');
  }

  String get(String key) => _prefs?.getString(key) ?? '';

  Future<bool?> setBool(String key, bool? value) async {
    return await _prefs?.setBool(key, value ?? false);
  }

  bool getBool(String key) => _prefs?.getBool(key) ?? false;

  Future<bool?> remove(String key) async {
    return await _prefs?.remove(key);
  }

  Future<bool?> clear() async {
    return await _prefs?.clear();
  }
}
