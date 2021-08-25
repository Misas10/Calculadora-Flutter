import 'package:calculadora/providers/input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => InputNumber()),
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
        builder: (context, child) {
          final _themeProvider = Provider.of<ThemeProvider>(context);
          _themeProvider.getTheme();
          return MaterialApp(
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            themeMode: _themeProvider.theme,
            debugShowCheckedModeBanner: false,
            home: Interface(),
          );
        },
      );
}
