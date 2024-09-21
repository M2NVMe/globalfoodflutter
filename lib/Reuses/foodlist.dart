import 'package:flutter/material.dart';

// Reusable custom list item widget
class CustomListItem extends StatelessWidget {
  final Widget image;
  final Widget title;
  final List<Widget> description;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final double buttonRadius;
  final double buttonElevation;
  final VoidCallback onButtonPressed;

  const CustomListItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.buttonRadius,
    required this.buttonElevation,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image,
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              SizedBox(height: 8),
              ...description,
            ],
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: buttonTextColor,
            elevation: buttonElevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius),
            ),
          ),
          child: Text(buttonText),
        ),
      ],
    );
  }
}