import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/service_locater.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/features/home/presenatation/view_models%20(manager)/similar_books_cubit/similar_books_cubit.dart';
import 'package:my_bookly/features/home/presenatation/views/book_details_view.dart';
import 'package:my_bookly/features/home/presenatation/views/home_view.dart';
import 'package:my_bookly/features/search/presentation/views/search_view.dart';
import 'package:my_bookly/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchsView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>(),),
        child:  BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
