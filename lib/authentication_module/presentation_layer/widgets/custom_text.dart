import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final double letterSpacing;
  final TextAlign textAlign;
  final Color? color;
  final int lines;
  const CustomText(
      {Key? key,
      required this.text,
      required this.size,
      this.letterSpacing = 1,
      this.textAlign = TextAlign.start,
      this.color,
      this.lines=1,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: color,
      ),
    );
  }
}
