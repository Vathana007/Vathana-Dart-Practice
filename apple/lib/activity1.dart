import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Activity',
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.blue,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  color: Colors.green,
                )),
                Container(
                    width: 100, height: 100, color: const Color(0xFFE91E63))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 100, width: 100, color: Colors.yellow),
                const SizedBox(width: 20),
                Container(height: 100, width: 100, color: Colors.yellow),
                const SizedBox(width: 20),
                Container(height: 100, width: 100, color: Colors.yellow),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: Colors.pink,
            ),
          ),
        ],
      ),
    ),
  ));
}
