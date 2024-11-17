import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(this.text, this.start, this.end, {super.key});

  final String text;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
        ),
        borderRadius: BorderRadius.circular(30),
        
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button("HELLO 1", Color(0xff4F7EF7), Color(0xff1142BF)),
              Button("HELLO 2", Color.fromARGB(255, 79, 188, 247), Color.fromARGB(255, 33, 232, 169)),
              Button("HELLO 3", Color.fromARGB(255, 241, 60, 60), Color.fromARGB(255, 220, 244, 38)),
            ],
          ),
        ),
      ),
    );
  }
}
