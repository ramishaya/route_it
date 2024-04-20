import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/core/utils/service_locator.dart';
import 'package:route_it/core/widgets/custom_transitions.dart';
import 'package:route_it/features/home/data/repo/home_repo_impl.dart';
import 'package:route_it/features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:route_it/features/home/presentation/view_models/techology_categories_cubit.dart/technology_categories_cubit.dart';
import 'package:route_it/features/home/presentation/views/tech_category_view.dart';
import 'package:route_it/features/home/presentation/views/home_view.dart';
import 'package:route_it/features/home/presentation/views/technology_details_view.dart';
import 'package:route_it/features/login/data/repos/login_repo_impl.dart';
import 'package:route_it/features/login/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:route_it/features/login/presentation/view_models/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:route_it/features/login/presentation/views/login_view.dart';
import 'package:route_it/features/register/data/repo/register_repo_impl.dart';
import 'package:route_it/features/register/presentation/view_models/register_cubit/register_cubit.dart';
import 'package:route_it/features/register/presentation/views/register_view1.dart';
import 'package:route_it/features/register/presentation/views/register_view2.dart';

// this class handels the routes in our app
abstract class AppRouter {
  static const kHomeView = "/kHomeView";
  static const kLoginView = "/";
  static const kRegisterView1 = '/kRegisterView1';
  static const kRegisterView2 = '/kRegisterView2';
  static const kTechCategoryView = "/kTechCategoryView";
  static const kTechnologyDetailsView = "/kTechnologyDetailsView";

  static final router = GoRouter(
    routes: [
      //Home
      GoRoute(
        path: kHomeView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<BottomNavBarCubit>(
              create: (context) => BottomNavBarCubit(),
            ),
            BlocProvider(
              create: (context) => TechnologyCategoriesCubit(
                  technologyCategoriesRepo: getIt.get<HomeRepoImpl>())
                ..fetchAllCategories(),
            )
          ],
          child: const HomeView(),
        ),
      ),
      //Register1
      GoRoute(
        path: kRegisterView1,
        builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider<PasswordVisibilityCubit>(
                  create: (context) => PasswordVisibilityCubit()),
              BlocProvider(
                create: (context) =>
                    RegisterCubit(registerRepo: getIt.get<RegisterRepoImpl>()),
                child: RegisterView1(),
              ),
            ],
            child: RegisterView1()),
      ),
      //Register2
      GoRoute(
        path: kRegisterView2,
        builder: (context, state) => const RegisterView2(),
      ),
      //Login
      GoRoute(
        path: kLoginView,
        builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider<PasswordVisibilityCubit>(
                  create: (context) => PasswordVisibilityCubit()),
              BlocProvider(
                create: (context) =>
                    LoginCubit(loginRepo: getIt.get<LoginRepoImpl>()),
                child: LoginView(),
              )
            ],
            child: LoginView()),
      ),
      GoRoute(
          path: kTechCategoryView,
          pageBuilder: (context, state) => const CustomTransitionPage(
              child: TechCategoryView(),
              transitionsBuilder: CustomTransitions.fadeTransition)),
      GoRoute(
        path: kTechnologyDetailsView,
        pageBuilder: (context, state) => const CustomTransitionPage(
            child: TechnologyDetailsView(),
            transitionsBuilder: CustomTransitions.slideFromRightTransition),
      )
    ],
  );
}
