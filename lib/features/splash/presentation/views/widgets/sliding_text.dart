import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
const SlidingText({super.key, required this.slidingAnimation, required this.text});

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
              style: const TextStyle(fontSize: 20),
            ),
          );
        });
  }
}
