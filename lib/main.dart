// import 'package:js/js.dart';
import 'package:calculadora/app.dart';
import 'package:calculadora/providers/input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => InputNumber()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Interface(),
      ),
    );
  }
}
