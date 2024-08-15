import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/core/utils/dependency_management/service_locator.dart';
import 'package:route_it/core/widgets/custom_transitions.dart';
import 'package:route_it/features/company/data/repos/company_repo_impl.dart';
import 'package:route_it/features/company/presentation/view_models/comapny_profile_cubit/company_profile_cubit.dart';
import 'package:route_it/features/company/presentation/views/company_profile/company_profile.dart';
import 'package:route_it/features/competition/data/models/competition_model.dart';
import 'package:route_it/features/competition/data/models/register_competition.dart';
import 'package:route_it/features/competition/data/repos/competition_repo_impl.dart';
import 'package:route_it/features/competition/presentation/view_models/add_project_link_cubit/add_project_link_cubit.dart';
import 'package:route_it/features/competition/presentation/view_models/competition_register_cubit/competition_register_cubit.dart';
import 'package:route_it/features/competition/presentation/view_models/competitions_cubit/competitions_cubit.dart';
import 'package:route_it/features/competition/presentation/view_models/competitor_cubit/competitor_cubit.dart';
import 'package:route_it/features/competition/presentation/view_models/winners_cubit/winners_cubit.dart';
import 'package:route_it/features/competition/presentation/views/competition_details/competition_details.dart';
import 'package:route_it/features/home/data/models/level_model.dart';
import 'package:route_it/features/home/data/models/technologies_model.dart';
import 'package:route_it/features/home/data/models/technology_category_model.dart';
import 'package:route_it/features/home/data/repo/home_repo_impl.dart';
import 'package:route_it/features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:route_it/features/home/presentation/view_models/level_cubit/level_cubit.dart';
import 'package:route_it/features/home/presentation/view_models/technology_cubit/technology_cubit.dart';
import 'package:route_it/features/home/presentation/view_models/techology_categories_cubit.dart/technology_categories_cubit.dart';
import 'package:route_it/features/home/presentation/views/framework_details_view.dart';
import 'package:route_it/features/home/presentation/views/technology_category_view.dart';
import 'package:route_it/features/home/presentation/views/home_view.dart';
import 'package:route_it/features/home/presentation/views/technology_details_view.dart';
import 'package:route_it/features/login/data/repos/login_repo_impl.dart';
import 'package:route_it/features/login/presentation/view_models/forget_password_cubit/forget_password_cubit.dart';
import 'package:route_it/features/login/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:route_it/features/login/presentation/view_models/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:route_it/features/login/presentation/view_models/reset_password_codecubit/reset_password_code_cubit.dart';
import 'package:route_it/features/login/presentation/view_models/reset_password_cubit/reset_password_cubit.dart';
import 'package:route_it/features/login/presentation/views/forget_password_view.dart';
import 'package:route_it/features/login/presentation/views/login_view.dart';
import 'package:route_it/features/login/presentation/views/reset_password_code_view.dart';
import 'package:route_it/features/login/presentation/views/reset_password_view.dart';
import 'package:route_it/features/register/data/repo/register_repo_impl.dart';
import 'package:route_it/features/register/presentation/view_models/complete_register_cubit/complete_register_cubit.dart';
import 'package:route_it/features/register/presentation/view_models/email_verification_cubit/email_verification_code_cubit.dart';
import 'package:route_it/features/register/presentation/view_models/image_picker_cubit/image_picker_cubit.dart';
import 'package:route_it/features/register/presentation/view_models/menu_cubit/menu_cubit.dart';
import 'package:route_it/features/register/presentation/view_models/radio_cubit/radio_cubit.dart';
import 'package:route_it/features/register/presentation/view_models/register_cubit/register_cubit.dart';
import 'package:route_it/features/register/presentation/views/email_verification_view.dart';
import 'package:route_it/features/register/presentation/views/register_view.dart';
import 'package:route_it/features/register/presentation/views/complete_register_view.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_skills_model.dart';
import 'package:route_it/features/roadmaps/data/models/skill_videos_model.dart';
import 'package:route_it/features/roadmaps/data/models/skills_articles_model.dart';
import 'package:route_it/features/roadmaps/data/repos/roadmap_repo_impl.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/article_sections_cubit/article_sections_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/page_index_cubit/page_index_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/road_map_ranking_cubit/road_map_ranking_cubit_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/roadmap_skills_cubit/road_map_skills_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/roadmaps_cubit/road_maps_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/skill_articles_cubit/skill_articles_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/skill_nav_bar_cubit/skill_nav_bar_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/skill_test_cubit/skill_test_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/skill_videos_cubit/skill_videos_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/views/road_map_ranking_view/road_map_ranking_view.dart';
import 'package:route_it/features/roadmaps/presentation/views/roadmap_skill/skill_view.dart';
import 'package:route_it/features/roadmaps/presentation/views/skill_articles/article_sections_view.dart';
import 'package:route_it/features/roadmaps/presentation/views/skill_videos/roadmap_skill_videos_view.dart';
import 'package:route_it/features/roadmaps/presentation/views/skill_videos/skill_video_item.dart';
import 'package:route_it/features/roadmaps/presentation/views/roadmaps_details_view/roadmaps_details_view.dart';
import 'package:route_it/features/roadmaps/presentation/views/roadmaps_view/roadmaps_view.dart';
import 'package:route_it/features/roadmaps/presentation/views/skill_test/skill_test_view.dart';
import 'package:route_it/features/search/data/repos/search__repo_impl.dart';
import 'package:route_it/features/search/presentation/view_models/general_search_cubit/general_search_cubit.dart';
import 'package:route_it/features/search/presentation/views/general_search_result_view/search_result_view.dart';

// this class handels the routes in our app
abstract class AppRouter {
  static const kHomeView = "/kHomeView";
  static const kLoginView = "/";
  static const kRegisterView = '/kRegisterView1';
  static const kCompleteRegisterView = '/kRegisterView2';
  static const kTechCategoryView = "/kTechCategoryView";
  static const kTechnologyDetailsView = "/kTechnologyDetailsView";
  static const kEmailVerificationView = "/kEmailVerificationView";
  static const kForgetPasswordView = "/kForgetPasswordView";
  static const kResetPasswordCodeView = "/kResetPasswordCodeView";
  static const kResetPasswordView = "/kResetPasswordView";

  static const kFrameWorkDetailsView = "/kFrameWorkDetailsView";
  static const kRoadmapsView = "/kRoadmapsView";
  static const kRoadMapsDetailsView = "/kRoadMapsDetailsView";
  static const kSkillTestView = "/kSkillTestView";
  static const kRoadMapSkillVideosView = "/kRoadMapSkillVideosView";
  static const kSkillView = "/SkillView";
  static const kSkillVideoItem = "/SkillVideoItem";
  static const kSkillArticeDetails = "/kSkillArticleDetails";
  static const kRoadMapRanking = "/kRoadMapRanking";

  static const kCompetitionsDetails = "/kCompetitionsDetails";
  static const kCompanyProfile = "/kCompanyProfile";
  static const kSearchResultView = "/kSearchResultView";
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
            ),
            BlocProvider(
              create: (context) =>
                  CompetitionsCubit(getIt.get<CompetitionRepoImpl>())
                    ..fetchCompetitions("current"),
            )
          ],
          child: const HomeView(),
        ),
      ),
      //Register1
      GoRoute(
        path: kRegisterView,
        pageBuilder: (context, state) => CustomTransitionPage(
            child: MultiBlocProvider(providers: [
              BlocProvider<PasswordVisibilityCubit>(
                  create: (context) => PasswordVisibilityCubit()),
              BlocProvider(
                create: (context) =>
                    RegisterCubit(registerRepo: getIt.get<RegisterRepoImpl>()),
              ),
            ], child: RegisterView()),
            transitionsBuilder: CustomTransitions.slideFromRightTransition),
      ),

      GoRoute(
          path: kEmailVerificationView,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: BlocProvider(
                  create: (context) => EmailVerificationCodeCubit(
                      registerRepo: getIt.get<RegisterRepoImpl>()),
                  child: const EmailVerificationView(),
                ),
                transitionsBuilder: CustomTransitions.slideFromRightTransition);
          }),

      //Register2
      GoRoute(
          path: kCompleteRegisterView,
          pageBuilder: (context, state) => CustomTransitionPage(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<RadioCubit>(
                    create: (context) => RadioCubit(),
                  ),
                  BlocProvider<MenuCubit>(
                    create: (context) => MenuCubit(),
                  ),
                  BlocProvider<ImagePickerCubit>(
                    create: (context) => ImagePickerCubit(),
                  ),
                  BlocProvider(
                    create: (context) => CompleteRegisterCubit(
                        registerRepo: getIt.get<RegisterRepoImpl>()),
                  ),
                ],
                child: const CompleteRegisterView(),
              ),
              transitionsBuilder: CustomTransitions.slideFromRightTransition)),
      //Login
      GoRoute(
        path: kLoginView,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider<PasswordVisibilityCubit>(
              create: (context) => PasswordVisibilityCubit()),
          BlocProvider(
            create: (context) =>
                LoginCubit(loginRepo: getIt.get<LoginRepoImpl>()),
            child: LoginView(),
          )
        ], child: LoginView()),
      ),

      GoRoute(
          path: kForgetPasswordView,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: BlocProvider(
                  create: (context) => ForgetPasswordCubit(
                      loginRepo: getIt.get<LoginRepoImpl>()),
                  child: ForgetPasswordView(),
                ),
                transitionsBuilder: CustomTransitions.slideFromRightTransition);
          }),
      GoRoute(
          path: kResetPasswordCodeView,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: BlocProvider(
                  create: (context) => ResetPasswordCodeCubit(
                      loginRepo: getIt.get<LoginRepoImpl>()),
                  child: const ResetPasswordCodeView(),
                ),
                transitionsBuilder: CustomTransitions.slideFromRightTransition);
          }),

      GoRoute(
          path: kResetPasswordView,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => ResetPasswordCubit(
                          loginRepo: getIt.get<LoginRepoImpl>()),
                    ),
                    BlocProvider<PasswordVisibilityCubit>(
                        create: (context) => PasswordVisibilityCubit()),
                  ],
                  child: ResetPasswordView(),
                ),
                transitionsBuilder: CustomTransitions.slideFromRightTransition);
          }),
      GoRoute(
          path: kTechCategoryView,
          pageBuilder: (context, state) {
            List<TechnologyCategoryModel> categoriesList =
                state.extra as List<TechnologyCategoryModel>;
            return CustomTransitionPage(
                child: TechnologyCategoryView(
                  categoriesList: categoriesList,
                ),
                transitionsBuilder: CustomTransitions.fadeTransition);
          }),
      GoRoute(
          path: kTechnologyDetailsView,
          pageBuilder: (context, state) {
            TechnologyCategoryModel technologyCategoryModel =
                state.extra as TechnologyCategoryModel;
            return CustomTransitionPage(
                child: BlocProvider(
                  create: (context) =>
                      TechnologyCubit(homeRepo: getIt.get<HomeRepoImpl>())
                        ..fetchAllTechologies(id: technologyCategoryModel.id!),
                  child: TechnologyDetailsView(
                    technologyCategoryModel: technologyCategoryModel,
                  ),
                ),
                transitionsBuilder: CustomTransitions.slideFromRightTransition);
          }),

      GoRoute(
          path: kFrameWorkDetailsView,
          builder: (context, state) {
            TechnologiesModel technologyModel =
                state.extra as TechnologiesModel;
            return BlocProvider(
                create: (context) =>
                    LevelCubit(homeRepo: getIt.get<HomeRepoImpl>())
                      ..fetchLevels(id: technologyModel.id!),
                child: FrameWorkDetailsView(
                  technologiesModel: technologyModel,
                ));
          }),

      GoRoute(
          path: kRoadmapsView,
          pageBuilder: (context, state) {
            LevelModel levelModel = state.extra as LevelModel;
            return CustomTransitionPage(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => RoadMapsCubit(
                          roadMapRepo: getIt.get<RoadMapRepoImpl>())
                        ..fetchRoadMaps(technologyLevelId: levelModel.id!),
                    ),
                    BlocProvider(
                      create: (context) => RoadMapRankingCubitCubit(
                          getIt.get<RoadMapRepoImpl>()),
                    ),
                  ],
                  child: RoadMapsView(level: levelModel.level!),
                ),
                transitionsBuilder: CustomTransitions.fadeTransition);
          }),
      GoRoute(
          path: kRoadMapRanking,
          pageBuilder: (context, state) {
            int roadMapId = state.extra as int;
            return CustomTransitionPage(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          RoadMapRankingCubitCubit(getIt.get<RoadMapRepoImpl>())
                            ..roadMapRanking(roadMapId: roadMapId),
                    ),
                  ],
                  child: RoadMapRankingView(
                    roadMapId: roadMapId,
                  ),
                ),
                transitionsBuilder: CustomTransitions.fadeTransition);
          }),

      GoRoute(
          path: kRoadMapsDetailsView,
          pageBuilder: (context, state) {
            RoadMapModel roadMapModel = state.extra as RoadMapModel;

            return CustomTransitionPage(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => RoadMapSkillsCubit(
                          roadMapRepo: getIt.get<RoadMapRepoImpl>())
                        ..fetchRoadMapSkills(roadmapId: roadMapModel.id!),
                    ),
                    BlocProvider(
                      create: (context) => PageIndexCubit(),
                    ),
                  ],
                  child: RoadMapsDetailsView(
                    roadMapModel: roadMapModel,
                  ),
                ),
                transitionsBuilder: CustomTransitions.slideFromRightTransition);
          }),
      GoRoute(
          path: kSkillTestView,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => SkillTestCubit(
                        roadMapRepo: getIt.get<RoadMapRepoImpl>())
                      ..fetchSkillTest(testId: 1),
                  ),
                ], child: const SkillTestView()),
                transitionsBuilder: CustomTransitions.slideFromRightTransition);
          }),

      GoRoute(
          path: kRoadMapSkillVideosView,
          pageBuilder: (context, state) {
            int roadMapSkillId = state.extra as int;
            return CustomTransitionPage(
                child: MultiBlocProvider(providers: [
                  BlocProvider(
                      create: (context) => SkillVideosCubit(
                          roadMapRepo: getIt.get<RoadMapRepoImpl>())
                        ..fetchSkillVideos(roadMapSkillId: roadMapSkillId)),
                ], child: const SkillVideosView()),
                transitionsBuilder: CustomTransitions.slideTransition);
          }),
      GoRoute(
          path: kSkillView,
          pageBuilder: (context, state) {
            RoadMapSkillsModel skill = state.extra as RoadMapSkillsModel;
            return CustomTransitionPage(
                child: MultiBlocProvider(providers: [
                  BlocProvider(
                      create: (context) => SkillVideosCubit(
                          roadMapRepo: getIt.get<RoadMapRepoImpl>())
                        ..fetchSkillVideos(roadMapSkillId: skill.id!)),
                  BlocProvider(
                    create: (context) => SkillArticlesCubit(
                        roadMapRepo: getIt.get<RoadMapRepoImpl>())
                      ..fetchSkillArticles(skillId: 9),
                  ),
                  BlocProvider(
                    create: (context) => SkillNavBarCubit(),
                  )
                ], child: SkillView(skillTitle: skill.title!)),
                transitionsBuilder: CustomTransitions.slideTransition);
          }),
      GoRoute(
          path: kSkillVideoItem,
          pageBuilder: (context, state) {
            SkillsVideos video = state.extra as SkillsVideos;
            return CustomTransitionPage(
                child: SkillVideoItem(
                  videoUrl: video.video!,
                  videoTitle: video.title!,
                ),
                transitionsBuilder: CustomTransitions.slideTransition);
          }),

      GoRoute(
          path: kSkillArticeDetails,
          pageBuilder: (context, state) {
            SkillsArticles article = state.extra as SkillsArticles;
            return CustomTransitionPage(
                child: BlocProvider(
                  create: (context) => ArticleSectionsCubit(
                      roadMapRepo: getIt.get<RoadMapRepoImpl>())
                    ..fetchArticleSections(articleId: article.id!),
                  child: ArticleSectionsView(title: article.title!),
                ),
                transitionsBuilder: CustomTransitions.slideTransition);
          }),

      GoRoute(
          path: kCompetitionsDetails,
          pageBuilder: (context, state) {
            final Competitions competitions = state.extra as Competitions;
            return CustomTransitionPage(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CompetitorCubit(
                          getIt.get<CompetitionRepoImpl>())
                        ..fetchAllCompetitors(competionId: competitions.id!),
                    ),
                    BlocProvider(
                        create: (context) => CompetitionRegisterCubit(
                            getIt.get<CompetitionRepoImpl>())),
                    BlocProvider(
                      create: (context) =>
                          AddProjectLinkCubit(getIt.get<CompetitionRepoImpl>()),
                    ),
                    BlocProvider(
                      create: (context) =>
                          WinnersCubit(getIt.get<CompetitionRepoImpl>())
                            ..fetchAllWiners(competitionId: competitions.id!),
                    )
                  ],
                  child: CompetitionDetails(competition: competitions),
                ),
                transitionsBuilder: CustomTransitions.slideTransition);
          }),

      GoRoute(
          path: kCompanyProfile,
          pageBuilder: (context, state) {
            final int companyId = state.extra as int;
            return CustomTransitionPage(
                child: MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) =>
                        CompanyProfileCubit(getIt.get<CompanyRepoImpl>())
                          ..fetchCompanyProfile(companyId: companyId),
                  ),
                ], child: const CompanyProfile()),
                transitionsBuilder: CustomTransitions.slideFromRightTransition);
          }),
      GoRoute(
          path: kSearchResultView,
          pageBuilder: (context, state) {
            final String name = state.extra as String;
            return CustomTransitionPage(
                child: MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) =>
                        GeneralSearchCubit(getIt.get<SearchRepoImpl>())
                          ..generalSearch(name: name),
                  ),
                ], child: const SearchResultView()),
                transitionsBuilder: CustomTransitions.slideTransition);
          }),
    ],
  );
}
