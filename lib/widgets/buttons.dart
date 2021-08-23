import 'package:calculadora/providers/input_provider.dart';
import 'package:calculadora/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

// List of buttons in the calculator app

class _ButtonsState extends State<Buttons> {
  final List<String> buttons = [
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
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(2),
      crossAxisCount: 4,
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        return Container(
          child: _buttons(context, buttons[index], index),
          padding: const EdgeInsets.all(10),
        );
      },
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(1, 1);
      },
    );
  }
}

TextButton _buttons(BuildContext context, String buttonLabel, int index) {
  final isDarkTheme = Provider.of<ThemeProvider>(context).isDarkTheme;
  var num = Provider.of<InputNumber>(context).num;
  return TextButton(
    onPressed: () {
      // button '.'
      if (index == 16) {
        // Check how many '.' has the current number
        if ('.'.allMatches(num).length >= 1) {
          debugPrint("Too much '.'");
          return;
        }
      }

      // Check buttons index
      switch (index) {

        // button 'C'
        case 0:
          {
            return Provider.of<InputNumber>(context, listen: false).setNum("");
          }

        // button '+/-'
        case 1:
          {
            return Provider.of<InputNumber>(context, listen: false)
                .isPositive();
          }

        // button '%'
        case 2:
          {
            return Provider.of<InputNumber>(context, listen: false).perc();
          }

        // button '+'
        case 3:
          {
            return Provider.of<InputNumber>(context, listen: false).som();
          }

        // button '-'
        case 7:
          {
            return Provider.of<InputNumber>(context, listen: false).subtr();
          }

        // button '*'
        case 11:
          {
            return Provider.of<InputNumber>(context, listen: false).multipl();
          }

        // button '/'
        case 15:
          {
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
    style: TextButton.styleFrom(
      backgroundColor: _isOperator(buttonLabel, context, isDarkTheme),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
    ),
    child: _isDeleteButton(buttonLabel)
        ? Text(
            buttonLabel,
            style: TextStyle(
              fontSize: 16,
            ),
          )
        : Icon(
            Icons.backspace,
            size: 16,
          ),
  );
}

Color _isOperator(String value, BuildContext context, bool isDarkTheme) {
  // For non-numbers buttons
  // And see if is dark theme or light theme
  // Setting differents colors for each theme
  if (value == "+" ||
      value == "-" ||
      value == "X" ||
      value == "/" ||
      value == "C" ||
      value == "+/-" ||
      value == "%" ||
      value == "=") {
    if (isDarkTheme) {
      return Color(0xffF05454);
    }

    return Color(0xffD0E8F2);
  }

  if (!isDarkTheme) return Color(0xffFFE8DF);

  return Color(0xff30475E);
}

bool _isDeleteButton(String value) {
  if (value == "<") return false;
  return true;
}
