import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const themeStatus = "THEMESTATUS";

  void setDarkTheme(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeStatus) ?? false;
  }
}
