import 'package:dicoding/src/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;
  final Color bgColor;
  final Color borderColor;
  final Color onPressedColor;
  final TextStyle textStyle;

  const CustomButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.bgColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.onPressedColor = Colors.white,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: bgColor,
          onPrimary: onPressedColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          side: BorderSide(
            color: borderColor,
            style: BorderStyle.solid,
            width: 1.6,
          ),
        ),
        child: Text(
          title,
          style: textStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
