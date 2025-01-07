import 'package:flutter/material.dart';
import 'package:loginvalidation/core/color/pallette.dart';

class RectBtn extends StatelessWidget {
  String text;
  VoidCallback? onPress;
  RectBtn({required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPress,
      child: Container(
        // padding: EdgeInsets.all(5),
        height: size * 0.25 / 2,
        width: size * 0.28,
        decoration: BoxDecoration(
            color: Pallette.primary, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color: Pallette.secondary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
