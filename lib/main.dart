import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/service_locater.dart';
import 'package:my_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/features/home/presenatation/view_models%20(manager)/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly/features/home/presenatation/view_models%20(manager)/newset_books_cubit/newset_books_cubit.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          // textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        // home: const SplashView(),
      ),
    );
  }
}
