//import 'package:calculadora/providers/input_provider.dart';
import 'package:calculadora/providers/input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/buttons.dart';
import 'providers/theme_provider.dart';

class Interface extends StatefulWidget {
  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  @override
  Widget build(BuildContext context) {
    final String inputText = Provider.of<InputNumber>(context).num.toString();

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculadora",
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.changeTheme();
              },
              // color: Colors.red,
              icon: const Icon(
                Icons.brightness_4,
                size: 28,
              ),
            ),
            SizedBox(height: 68),
            Consumer<InputNumber>(
              builder: (context, value, child) {
                return Container(
                  constraints: BoxConstraints(maxHeight: 56),
                  width: double.infinity,
                  child: Text(
                    inputText,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                );
              },
            ),
            Expanded(
              child: Buttons(),
            ),
          ],
        ),
      ),
    );
  }
}
