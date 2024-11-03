import 'package:flutter/material.dart';

enum IconPosition { left, right, defaultPosition }

enum ButtonType { primary, secondary, disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon; 
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.defaultPosition,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color textColor;

    // Set button color and text color based on button type
    switch (buttonType) {
      case ButtonType.primary:
        buttonColor = Colors.blue;
        textColor = Colors.black;
        break;
      case ButtonType.secondary:
        buttonColor = Colors.green;
        textColor = Colors.black;
        break;
      case ButtonType.disabled:
        buttonColor = Colors.grey;
        textColor = Colors.black;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 300),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconPosition == IconPosition.right
              ? [
                  Text(
                    label,
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(width: 8),
                  Icon(icon, color: textColor),
                ]
              : [
                  Icon(icon, color: textColor),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(color: textColor),
                  ),
                ],
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
        appBar: AppBar(title: const Text("Custom Button"),
        backgroundColor: Colors.grey,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                buttonType: ButtonType.primary,
              ),
              SizedBox(height: 20,),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                buttonType: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 20,),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                buttonType: ButtonType.disabled,
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        )
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}