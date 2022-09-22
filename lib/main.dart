import 'package:calculate_game/provider/user_choice.dart';
import 'package:calculate_game/screens/complexity_screen.dart';
import 'package:calculate_game/screens/game_screen.dart';
import 'package:calculate_game/screens/result_screen.dart';
import 'package:calculate_game/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsereChoice(),
      child: MaterialApp(
        title: 'Додаватор',
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: GameColors.bg),
        home: ComplexityScreen(),
        routes: {
          '/home': (context) => ComplexityScreen(),
          '/game': (context) => GameScreen(),
          '/result': (context) => ResultScreen(),
        },
      ),
    );
  }
}
