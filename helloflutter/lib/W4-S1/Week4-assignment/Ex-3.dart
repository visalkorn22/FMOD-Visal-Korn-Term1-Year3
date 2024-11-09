import 'package:flutter/material.dart';

enum IconAlignment {
  left(Alignment.centerLeft),
  right(Alignment.centerRight);

  final Alignment alignment;
  const IconAlignment(this.alignment);
}

enum ButtonStyle {
  primary(Color(0xFF0050FF)),
  secondary(Color(0xFF00FF0F)),
  disabled(Color.fromARGB(255, 54, 54, 54));

  final Color color;
  const ButtonStyle(this.color);
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.buttonStyle,
    required this.iconAlignment,
  });

  final String label;
  final IconData icon;
  final ButtonStyle buttonStyle;
  final IconAlignment iconAlignment;

  Color get buttonColor => buttonStyle.color;
  Alignment get iconPosition => iconAlignment.alignment;

  void onButtonPressed() {
    print("Button '$label' pressed");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconAlignment == IconAlignment.left) Icon(icon),
            SizedBox(width: 8),
            Text(label,
                style: const TextStyle(fontSize: 18, color: Colors.white)),
            if (iconAlignment == IconAlignment.right) Icon(icon),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom Buttons Example',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
                label: "Submit",
                icon: Icons.check,
                buttonStyle: ButtonStyle.primary,
                iconAlignment: IconAlignment.left),
            CustomButton(
                label: "Timer",
                icon: Icons.timer,
                buttonStyle: ButtonStyle.secondary,
                iconAlignment: IconAlignment.right),
            CustomButton(
                label: "Disabled",
                icon: Icons.disabled_by_default,
                buttonStyle: ButtonStyle.disabled,
                iconAlignment: IconAlignment.left),
          ],
        ),
      ),
    ),
  ));
}
