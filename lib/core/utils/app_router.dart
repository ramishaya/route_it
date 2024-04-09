import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/core/widgets/custom_transitions.dart';
import 'package:route_it/features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:route_it/features/home/presentation/views/domains_view.dart';
import 'package:route_it/features/home/presentation/views/home_view.dart';
import 'package:route_it/features/login/views/login_view.dart';
import 'package:route_it/features/register/views/register_view1.dart';
import 'package:route_it/features/register/views/register_view2.dart';

// this class handels the routes in our app
abstract class AppRouter {
  static const kHomeView = "/kHomeView";
  static const kLoginView = "/";
  static const kRegisterView1 = '/kRegisterView1';
  static const kRegisterView2 = '/kRegisterView2';
  static const kDomainsView = "/kDomainsView";

  static final router = GoRouter(
    routes: [
      //Home
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
      //Register1
      GoRoute(
        path: kRegisterView1,
        builder: (context, state) => RegisterView1(),
      ),
      //Register2
      GoRoute(
        path: kRegisterView2,
        builder: (context, state) => RegisterView2(),
      ),
      //Login
      GoRoute(
        path: kLoginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
          path: kDomainsView,
          pageBuilder: (context, state) => const CustomTransitionPage(
              child: DomainsView(),
              transitionsBuilder: CustomTransitions.slideTransition)),
    ],
  );
}
