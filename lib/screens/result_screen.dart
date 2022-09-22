import 'package:calculate_game/provider/user_choice.dart';
import 'package:calculate_game/styles/theme.dart';
import 'package:calculate_game/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int easy = 0;
  int normal = 0;
  int hard = 0;

  void _getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    easy = await prefs.getInt('easy') ?? 0;
    normal = await prefs.getInt('normal') ?? 0;
    hard = await prefs.getInt('hard') ?? 0;
    setState(() {});
  }

  void _setHistory(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  @override
  void initState() {
    _getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String complexity =
        Provider.of<UsereChoice>(context, listen: false).choisceComplexity;
    int result = Provider.of<UsereChoice>(context, listen: false).result;
    print(result);
    if (complexity == 'easy') {
      if (easy < result) {
        _setHistory(complexity, result);
      }
    }
    if (complexity == 'normal') {
      if (normal < result) {
        _setHistory(complexity, result);
      }
    }
    if (complexity == 'hard') {
      if (hard < result) {
        _setHistory(complexity, result);
      }
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ваш результат: $result',
              style: TextStyles.bigTextStyle,
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Text(
              'Історія по рівнях:',
              style: TextStyles.bigTextStyle,
            ),
            SizedBox(height: 10),
            Text(
              'Легкий: $easy',
              style: TextStyles.mediumTextStyle,
            ),
            SizedBox(height: 5),
            Text(
              'Середній: $normal',
              style: TextStyles.mediumTextStyle,
            ),
            SizedBox(height: 5),
            Text(
              'Важкий: $hard',
              style: TextStyles.mediumTextStyle,
            ),
            SizedBox(height: 40),
            CustomButton(
              onTab: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              title: 'Вибрати складність',
            ),
          ],
        ),
      ),
    );
  }
}
