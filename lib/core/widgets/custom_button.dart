import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      this.borderRadius,
      required this.text,
       this.fonstSize});
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fonstSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.circular(
                    16,
                  ),
            ),
          ),
          child: Text(
            text,
            style: Styles.textStyle20.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fonstSize,
            ),
          )),
    );
  }
}
