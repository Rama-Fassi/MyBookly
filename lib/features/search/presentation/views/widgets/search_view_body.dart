import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/utils/styles.dart';
import 'package:my_bookly/features/search/presentation/view_models/search_result_cubit/search_result_books_cubit.dart';
import 'package:my_bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:my_bookly/features/search/presentation/views/widgets/search_result_list_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    String category;
    return BlocBuilder<SearchResultCubit, SearchResultBooksState>(
      builder: (context, state) { 
        if (state is SearchResultBooksSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .02,
                ),
                CustomSearchTextField(
                  onSubmitted: (value) {
                    category = value;
                    setState(() {
                      BlocProvider.of<SearchResultCubit>(context)
                          .searchResultBooks(category: category);
                      print('$category');
                    });
                  },
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Search Results',
                  style: Styles.textStyle18,
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(child: SearchResultListView(bookModel: state.books,))
              ],
            ),
          );
        } 
        else {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .02,
                ),
                CustomSearchTextField(
                  onSubmitted: (value) {
                    category = value;
                    setState(() {
                      BlocProvider.of<SearchResultCubit>(context)
                          .searchResultBooks(category: category);
                      print('$category');
                    });
                  },
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Search Results',
                  style: Styles.textStyle18,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ); 
        }
      },
    );
  }
}
