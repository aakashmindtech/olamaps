import 'package:flutter/material.dart';

class BorderedText extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final double fontSize;

  BorderedText({
    required this.text,
    required this.textColor,
    required this.borderColor,
    required this.borderWidth,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stroked text
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = borderWidth
              ..color = borderColor,
          ),
        ),
        // Solid text
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
