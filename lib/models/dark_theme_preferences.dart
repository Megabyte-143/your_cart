import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const theme_status = "THEMESTATUS";

  setDarkTheme(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(theme_status, value);
  }

  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(theme_status) ?? false;
  }
}
