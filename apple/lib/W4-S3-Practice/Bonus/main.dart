import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  final String title;
  const ScoreCard({super.key, required this.title});

  @override  
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 0;

  void add() {
    if(score < 10) {
      setState(() {
        score++;
      });
    }
  }

  void remove() {
    if(score > 0) {
      setState(() {
        score--;
      });
    }
  }

  Color getProgressColor() {
    if(score <= 4) {
      return Color.lerp(Colors.green[200],Colors.green[500], score / 4)!;
    }
    else if(score <= 9) {
      return Color.lerp(Colors.green[500], Colors.green[900], (score - 5) / 5)!;
    }
    else {
      return Colors.green[900]!;
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: remove,
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(
                width: 100,
              ),
              IconButton(
                onPressed: add,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: (score / 10) * 420,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: getProgressColor(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreCard(title: 'My Score in Flutter'),
            SizedBox(height: 20),
            ScoreCard(title: 'My Score in Dart'),
            SizedBox(height: 20),
            ScoreCard(title: 'My Score in React'),
          ],
        ),
      ),
    ),
  ));
}