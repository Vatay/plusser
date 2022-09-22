import 'package:calculate_game/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTab;
  final String title;
  final double width;
  final double height;
  const CustomButton({
    Key? key,
    required this.onTab,
    required this.title,
    this.width = 270,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTab,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(GameColors.bgBtn),
          foregroundColor: MaterialStateProperty.all(GameColors.bgBtnFocus),
        ),
      ),
    );
  }
}
