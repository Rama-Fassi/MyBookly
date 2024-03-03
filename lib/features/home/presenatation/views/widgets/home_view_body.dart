import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assests.dart';
import 'package:my_bookly/core/utils/styles.dart';
import 'package:my_bookly/features/home/presenatation/views/widgets/best_seller_List_view_item.dart';
import 'package:my_bookly/features/home/presenatation/views/widgets/custom_app_bar.dart';
import 'package:my_bookly/features/home/presenatation/views/widgets/featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeaturedBooksListView(),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
        ),
        BestSellerListViewItem(),
      ],
    );
  }
}

