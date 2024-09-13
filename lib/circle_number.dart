import 'package:flutter/material.dart';

class CircledNumber extends StatelessWidget {
  final int number;
  final double size;
  final Color backgroundColor;
  final Color textColor;

  const CircledNumber({
    super.key,
    required this.number,
    this.size = 30,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: size * 0.6,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
