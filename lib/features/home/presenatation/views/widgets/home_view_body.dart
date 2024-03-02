import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presenatation/views/widgets/custom_app_bar.dart';
import 'package:my_bookly/features/home/presenatation/views/widgets/custom_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        CustomListViewItem(),
      ],
    );
  }
}
