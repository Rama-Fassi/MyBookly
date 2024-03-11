import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/assests.dart';
import 'package:my_bookly/core/utils/service_locater.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
import 'package:my_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/features/home/presenatation/view_models%20(manager)/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly/features/splash/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  //FeaturedBooksCubit cubit = FeaturedBooksCubit(getIt.get<HomeRepoImpl>());
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlideAnimaion();
    navigateToHome();
  // BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssestData.logo),
        const SizedBox(
          height: 20,
        ),
        SlidingText(
          slidingAnimation: slidingAnimation,
          text: "Read free books",
        ),
      ],
    );
  }

  void initSlideAnimaion() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
      // Get.to(
      //   () => const HomeView(),
      //   transition: Transition.fade,duration: kTransitionDuration
      // );
    });
  }
}
