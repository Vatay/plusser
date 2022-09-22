import 'package:calculate_game/provider/user_choice.dart';
import 'package:calculate_game/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplexityScreen extends StatefulWidget {
  const ComplexityScreen({super.key});

  @override
  State<ComplexityScreen> createState() => _ComplexityScreenState();
}

class _ComplexityScreenState extends State<ComplexityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Виберіть складність гри',
              style: TextStyle(
                fontSize: 28,
                // color: Colors.white
              ),
            ),
            SizedBox(height: 30),
            CustomButton(
              onTab: () {
                _selectComplexity(context: context, complexity: 'easy');
              },
              title: 'Легко (Одноцифрові)',
            ),
            SizedBox(height: 15),
            CustomButton(
              onTab: () {
                _selectComplexity(context: context, complexity: 'normal');
              },
              title: 'Нормальний (Двоцифрові)',
            ),
            SizedBox(height: 15),
            CustomButton(
              onTab: () {
                _selectComplexity(context: context, complexity: 'hard');
              },
              title: 'Важкий (Трицифрові)',
            ),
          ],
        ),
      ),
    );
  }

  _selectComplexity(
      {required BuildContext context, required String complexity}) {
    Provider.of<UsereChoice>(context, listen: false).createData(complexity);
    Navigator.of(context).pushReplacementNamed('/game');
  }
}
