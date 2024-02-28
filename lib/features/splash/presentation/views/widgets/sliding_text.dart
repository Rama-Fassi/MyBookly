import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  SlidingText({super.key, required this.slidingAnimation, required this.text});

  final Animation<Offset> slidingAnimation;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, child) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          );
        });
  }
}
