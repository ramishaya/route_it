import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/featuers/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:route_it/featuers/home/presentation/views/home_view.dart';

// this class handels the routes in our app
abstract class AppRouter {
  static const kHomeView = "/";

  static final router = GoRouter(routes: [
    GoRoute(
      path: kHomeView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavBarCubit>(
            create: (context) => BottomNavBarCubit(),
          )
        ],
        child: const HomeView(),
      ),
    ),
  ]);
}
