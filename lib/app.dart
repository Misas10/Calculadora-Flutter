//import 'package:calculadora/providers/input_provider.dart';
import 'package:calculadora/providers/input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/buttons.dart';

class Interface extends StatefulWidget {
  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  @override
  Widget build(BuildContext context) {
    String inputText = Provider.of<InputNumber>(context).num.toString();

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<InputNumber>(
              builder: (context, value, child) {
                return Text(inputText);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Expanded(child: Buttons()),
            //SizedBox(height: MediaQuery.of(context).padding.bottom)
          ],
        ),
      ),
    );
  }
}
