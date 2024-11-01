import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool iconPositionRight;
  final ButtonType buttonType;

  const CustomButton({
    Key? key,
    required this.label,
    required this.icon,
    this.iconPositionRight = false,
    this.buttonType = ButtonType.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    switch (buttonType) {
      case ButtonType.primary:
        buttonColor = Colors.blue;
        break;
      case ButtonType.secondary:
        buttonColor = Colors.green;
        break;
      case ButtonType.disabled:
        buttonColor = Colors.grey;
        break;
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: buttonType == ButtonType.disabled ? null : () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: iconPositionRight
            ? [
                Text(label),
                const SizedBox(width: 20),
                Icon(icon),
              ]
            : [
                Icon(icon),
                const SizedBox(width: 20),
                Text(label),
              ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Button')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                buttonType: ButtonType.primary,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                buttonType: ButtonType.secondary,
                iconPositionRight: true,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                buttonType: ButtonType.disabled,
                iconPositionRight: true,
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



