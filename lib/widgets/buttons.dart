import 'package:calculadora/providers/input_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

// List of buttons in the calculator app

class _ButtonsState extends State<Buttons> {
  List<String> buttons = [
    "C", // 0
    "+/-", // 1
    "%", // 2
    "+", // 3
    "1", // 4
    "2", // 5
    "3", // 6
    "-", // 7
    "4", // 8
    "5", // 9
    "6", // 10
    "X", // 11
    "7", // 12
    "8", // 13
    "9", // 14
    "/", // 15
    ".", // 16
    "0", // 17
    "<", // 18
    "=", // 19
  ];

  @override
  Widget build(BuildContext context) {
    // Create a GridView and
    // Allow us to change Tile's Cross and Main axix
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(2),
      crossAxisCount: 4,
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        return _buttons(context, buttons[index], index);
      },
      staggeredTileBuilder: (index) {
        // if (index == 17) {
        //   return StaggeredTile.count(2, 1);
        // }
        return StaggeredTile.count(1, 1);
      },
    );
  }
}

TextButton _buttons(BuildContext context, String buttonLabel, int index) {
  /// var num = Provider.of<InputNumber>(context).num;
  return TextButton(
      onPressed: () {
        // Check buttons index
        switch (index) {

          // button 'C'
          case 0:
            {
              return Provider.of<InputNumber>(context, listen: false)
                  .setNum("");
            }

          // button '+'
          case 3:
            {
              return Provider.of<InputNumber>(context, listen: false).som();
              
            }

          // button '-'
          case 7: {
            return Provider.of<InputNumber>(context, listen: false).subtr();
          }

          // button '*'
          case 11: {
            return Provider.of<InputNumber>(context, listen: false).multipl();
          }

          // button '/'
          case 15: {
            return Provider.of<InputNumber>(context, listen: false).div();
          }

          // button '<'
          case 18:
            {
              return Provider.of<InputNumber>(context, listen: false).del();
            }

          // button '='
          case 19:
            {
              return Provider.of<InputNumber>(context, listen: false).result();
            }

          default:
            {
              return Provider.of<InputNumber>(context, listen: false)
                  .addNum(buttonLabel);
            }
        }
      },
      child: Text(buttonLabel));
}

bool IsOperator(String value) {
  if (value == "+" || value == "-" || value == "X" || value == "/") {
    return true;
  }
  return false;
}
