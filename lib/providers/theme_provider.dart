import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../widgets/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? theme;

  bool get isDarkTheme => theme == ThemeMode.dark;

  getTheme() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    bool? _isDarkTheme = _prefs.getBool("isDarkTheme");

    if (_isDarkTheme != null) {
      if (_isDarkTheme)
        theme = ThemeMode.dark;
      else
        theme = ThemeMode.light;
    }

    notifyListeners();
  }

  void changeTheme() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    bool? _isDarkTheme = _prefs.getBool("isDarkTheme");

    if (isDarkTheme) {
      theme = ThemeMode.light;
      if (_isDarkTheme != null) _prefs.setBool("isDarkTheme", false);
    } else {
      theme = ThemeMode.dark;
      if (_isDarkTheme != null) _prefs.setBool("isDarkTheme", true);
    }

    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(primary: Color(0xffDDDDDD)),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(primary: Color(0xff456268)),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffD0E8F2),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Color(0xff456268),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textTheme: TextTheme(
      headline2: TextStyle(
        color: Color(0xff456268),
      ),
    ),
  );
}
