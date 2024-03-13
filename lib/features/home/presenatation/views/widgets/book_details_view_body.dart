import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/home/presenatation/views/widgets/book_details_section.dart';
import 'package:my_bookly/features/home/presenatation/views/widgets/custom_book_details_app_bar.dart';
import 'package:my_bookly/features/home/presenatation/views/widgets/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(bookModel: bookModel,),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
