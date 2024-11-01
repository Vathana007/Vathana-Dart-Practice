import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {

  final String title;
  final IconData icon;
  final Color color;

  const HobbyCard({Key? key, required this.title, required this.icon,this.color = Colors.blue, }) 
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: const Text("My Hobbies"),
        ),
        body: const Padding(
          padding: EdgeInsets.only(right: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: "Football",
                icon: Icons.sports_soccer,
              ),
                    HobbyCard(
                title: "Travelling",
                icon: Icons.travel_explore,
                color: Colors.green,
              ),
              HobbyCard(
                title: "Reading",
                icon: Icons.book,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}