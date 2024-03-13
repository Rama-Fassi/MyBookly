import 'package:flutter/material.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            fonstSize: 20,
            text: 'Preview',
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18)),
          ),
        ),
      ],
    );
  }
}
