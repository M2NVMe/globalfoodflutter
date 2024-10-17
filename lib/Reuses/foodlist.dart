import 'package:flutter/material.dart';

// Reusable custom list item widget
class CustomListItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback onButtonPressed;

  const CustomListItem({
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 2,
            blurRadius: 10, // Blurriness of the shadow
            offset: Offset(0, 5), // Vertical shadow offset
          ),
        ],
      ),
      padding: EdgeInsets.all(16), // Adds padding around the content
      child: Row(
        children: [
          // Check if the image is a URL and load accordingly
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
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: buttonTextColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
