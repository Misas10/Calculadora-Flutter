import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkTheme => themeMode == ThemeMode.dark;

  void changeTheme() {
    if (!isDarkTheme)
      themeMode = ThemeMode.dark;
    else
      themeMode = ThemeMode.light;
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
