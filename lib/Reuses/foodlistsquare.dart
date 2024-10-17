import 'package:flutter/material.dart';

// Reusable custom list item widget
class CustomListItemSquare extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback onButtonPressed;

  const CustomListItemSquare({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: image.startsWith('http')
              ? Image.network(image, height: 80, width: 80, fit: BoxFit.cover)
              : Image.asset(image, height: 80, width: 80, fit: BoxFit.cover),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
      ],
    );
  }
}
