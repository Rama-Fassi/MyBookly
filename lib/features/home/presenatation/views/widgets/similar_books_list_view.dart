
import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presenatation/views/widgets/custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }),
    );
  }
}