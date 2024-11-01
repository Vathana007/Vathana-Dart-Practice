import 'package:flutter/material.dart';
import 'dart:math';

const String diceImage1 = 'assets/W4-S1-activity/dice-1.png';
const String diceImage2 = 'assets/W4-S1-activity/dice-2.png';
const String diceImage3 = 'assets/W4-S1-activity/dice-3.png';
const String diceImage4 = 'assets/W4-S1-activity/dice-4.png';
const String diceImage5 = 'assets/W4-S1-activity/dice-5.png';
const String diceImage6 = 'assets/W4-S1-activity/dice-16.png';


class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = diceImage1;
  final random = Random();

  void rollDice() {
    setState(() {
      int diceroll = random.nextInt(6);
      switch(diceroll) {
        case 1:
          activeDiceImage = diceImage1;
          break;
        case 2:
          activeDiceImage = diceImage2;
          break;
        case 3:
          activeDiceImage = diceImage3;
          break;
        case 4:
          activeDiceImage = diceImage4;
          break;
        case 5:
          activeDiceImage = diceImage5;
          break;
        case 6:
          activeDiceImage = diceImage6;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));
