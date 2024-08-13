import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/constants/assets_data.dart';
import 'package:route_it/core/utils/router/app_router.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/skill_articles_cubit/skill_articles_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/views/skill_articles/widgets/article_card.dart';

class SkillArticlesView extends StatelessWidget {
  const SkillArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SkillArticlesCubit, SkillArticlesState>(
        builder: (context, state) {
          if (state is SkillArticlesLoaded) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.articles.length,
                itemBuilder: (context, index) => InkWell(
                      //! dont  forget to pass the video URL to the Next Screen
                      child: GestureDetector(
                        onTap: () => GoRouter.of(context).push(
                            AppRouter.kSkillArticeDetails,
                            extra: state.articles[index]),
                        child: ArticleCard(
                          title: state.articles[index].title!,
                          imagePath: AssetsData.welcomeImg,
                          author: "Rami shaya",
                          category: "Programing",
                          categoryColor: AppColors.secondaryColor,
                          timeAgo: "2H 34 min",
                        ),
                      ),
                    ) // herre we will put the Course Video Card

                );
          } else if (state is SkillArticlesLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.whiteColor,
            ));
          } else {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.whiteColor));
          }
        },
      ),
    );
  }
}
