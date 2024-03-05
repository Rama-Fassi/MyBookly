import 'package:flutter/material.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            text: '19.99\$',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
          ),
        ),
        Expanded(
          child: CustomButton(
            fonstSize: 20,
            text: 'Free Preview',
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18)),
          ),
        ),
      ],
    );
  }
}
