import 'package:flutter/material.dart';
import 'package:loginvalidation/core/color/pallette.dart';

class Textheading extends StatelessWidget {
  final String title;
  const Textheading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 30, color: Pallette.primary, fontWeight: FontWeight.bold),
    );
  }
}
