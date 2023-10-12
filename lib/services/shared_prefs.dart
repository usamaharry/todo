import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  late final SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<dynamic> getStringList(String key) {
    final list = _prefs.getStringList(key);

    return list ?? [];
  }

  Future<bool> setListOfString(String key, List<String> list) async {
    await _prefs.setStringList(key, list);

    return true;
  }
}
