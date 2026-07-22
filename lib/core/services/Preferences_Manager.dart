import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static final PreferencesManager _instanse = PreferencesManager._internal();

  factory PreferencesManager() {
    return _instanse;
  }

  PreferencesManager._internal();

  late final SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  String? getString(String key){
   return _preferences.getString(key);
  }
  Future<bool> setString(String key,String value){
    return _preferences.setString(key, value);
  }
  Future<bool> remove(String key){
    return _preferences.remove(key);
  }
  Future<bool> clear() {
    return _preferences.clear();
  }
}
