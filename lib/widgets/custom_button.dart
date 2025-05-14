import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color textColor;
  final VoidCallback? onPressed;
  final double fontSize;  // Accept fontSize

  const CustomButton({
    super.key,
    required this.title,
    required this.bgColor,
    required this.textColor,
    this.onPressed,
    required double width,
    required double height,
    required this.fontSize,  // Accept fontSize in constructor
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.3; // Adjust button width dynamically

    return SizedBox(
      width: buttonWidth, // Set responsive width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize, // Use the fontSize passed from the constructor
          ),
        ),
      ),
    );
  }
}
