import 'package:calculate_game/provider/user_choice.dart';
import 'package:calculate_game/styles/colors.dart';
import 'package:calculate_game/styles/theme.dart';
import 'package:calculate_game/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen();

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> ansversResult = []; // 'n' - none, t = true, f = false
  List<int> a = [];
  List<int> b = [];
  int counter = 0;
  int counterCorrect = 0;
  String answerText = '';
  final int numberOfQuestions = 5;

  List<String> calculatorButtons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'C',
    '0',
    '='
  ];

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      ansversResult.add('n');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      a = Provider.of<UsereChoice>(context, listen: false).a;
      b = Provider.of<UsereChoice>(context, listen: false).b;
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: GameColors.gameTopBg,
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _answersRow(),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${a[counter]} + ${b[counter]} = ',
                    style: TextStyles.bigTextStyle,
                  ),
                  Container(
                    child: Text(
                      answerText,
                      style: TextStyles.bigTextStyle,
                    ),
                    width: 90,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: GameColors.answerBg,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(12),
                color: GameColors.gameBotBg,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: calculatorButtons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    mainAxisExtent: 90,
                  ),
                  itemBuilder: (context, index) {
                    return CalcButton(
                      title: calculatorButtons[index],
                      onTab: () {
                        _buttonClick(calculatorButtons[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttonClick(String title) {
    if (title == 'C') {
      answerText = '';
    } else if (title == '=') {
      if (answerText == '') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.red,
              titlePadding: EdgeInsets.all(15.0),
              title: Text(
                'Введіть відповідь',
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      } else if ((a[counter] + b[counter]) == int.parse(answerText)) {
        ansversResult[counter] = 't';
        counterCorrect += 1;
        _results();
      } else {
        ansversResult[counter] = 'f';
        _results();
      }
    } else if (answerText.length < 4) {
      answerText += title;
    }
    setState(() {});
  }

  void _results() {
    answerText = '';
    if (counter == 4) {
      Provider.of<UsereChoice>(context, listen: false)
          .setResult(counterCorrect);
      Navigator.pushReplacementNamed(context, '/result');
    } else {
      counter += 1;
      setState(() {});
    }
  }

  List<Container> _answersRow() {
    Color? color;
    color = GameColors.answerNone;
    List<Container> containers = [];
    for (int i = 0; i < numberOfQuestions; i++) {
      if (ansversResult[i] == 'n') {
        color = GameColors.answerNone;
      } else if (ansversResult[i] == 't') {
        color = GameColors.answerTrue;
      } else if (ansversResult[i] == 'f') {
        color = GameColors.answerFalse;
      }
      containers.add(Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
            ),
          ],
        ),
      ));
    }
    return containers;
  }
}
