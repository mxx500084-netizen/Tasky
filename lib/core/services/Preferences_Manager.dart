import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static final PreferencesManager _instance = PreferencesManager._internal();

  factory PreferencesManager() {
    return _instance;
  }

  PreferencesManager._internal();

  late final SharedPreferences _preferences;

  /// تهيئة الحزمة قبل الاستخدام (يتم استدعاؤها في main)
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // ================= String =================
  String? getString(String key) {
    return _preferences.getString(key);
  }

  Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  // ================= Int =================
  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  Future<bool> setInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  // ================= Double =================
  double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  Future<bool> setDouble(String key, double value) {
    return _preferences.setDouble(key, value);
  }

  // ================= Bool =================
  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  // ================= List<String> =================
  List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }

  Future<bool> setStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }

  // ================= Helper Methods =================

  /// التاكد مما إذا كان هناك قيمة محفوظة بهذا المفتاح
  bool containsKey(String key) {
    return _preferences.containsKey(key);
  }

  /// الحصول على كافة المفتاحيج المسجلة
  Set<String> getKeys() {
    return _preferences.getKeys();
  }

  /// حذف عنصر محدد
  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }

  /// مسح كافة البيانات المخزنة
  Future<bool> clear() {
    return _preferences.clear();
  }
}