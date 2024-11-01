import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final LinearGradient? gradient;

  const CustomCard({super.key, required this.text, this.color, this.gradient,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color, 
        borderRadius: BorderRadius.circular(100),
        gradient: gradient,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(text: "OOP", color: Colors.blue[100]),
              const SizedBox(height: 20),
              CustomCard(text: "DART", color: Colors.blue[300]),
              const SizedBox(height: 20),
              CustomCard(
                text: "FLUTTER",
                color: Colors.blue[600],
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[300]!,
                    Colors.blue[600]!,
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomCard(
                text: "FLUTTER BASIC",
                color: Colors.blue[600],
                gradient: LinearGradient(
                  colors: [
                    Colors.red[300]!,
                    Colors.blue[600]!,
                    Colors.yellow[300]!,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
