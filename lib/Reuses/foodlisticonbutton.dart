import 'package:flutter/material.dart';

// Reusable custom list item widget
class Foodlisticonbutton extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Icon icon;
  final Color buttonColor;
  final VoidCallback onButtonPressed;

  const Foodlisticonbutton({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.icon,
    required this.buttonColor,
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
              Text(title, style: TextStyle(fontSize:17, fontWeight: FontWeight.bold),),
              SizedBox(height: 8),
              Text(description, style: TextStyle(fontSize:13, fontWeight: FontWeight.normal),),
            ],
          ),
        ),
        SizedBox(width: 16),
        IconButton(onPressed: onButtonPressed, icon: icon, style: IconButton.styleFrom(backgroundColor: buttonColor,),),
      ],
    );
  }
}