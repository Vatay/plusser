import 'package:calculate_game/styles/colors.dart';
import 'package:calculate_game/styles/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalcButton extends StatelessWidget {
  final String title;
  final VoidCallback onTab;
  var btnColor = GameColors.bgBtn;

  CalcButton({required this.title, required this.onTab});

  @override
  Widget build(BuildContext context) {
    if (title == 'C') {
      btnColor = GameColors.answerFalse;
    }
    if (title == '=') {
      btnColor = GameColors.answerTrue;
    }
    return Container(
      child: ElevatedButton(
        onPressed: onTab,
        child: Text(
          title,
          style: TextStyles.bigTextStyle,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(btnColor),
        ),
      ),
    );
  }
}
