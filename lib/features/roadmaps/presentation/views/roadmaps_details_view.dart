import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/core/widgets/custom_back_button2.dart';
import 'package:route_it/core/widgets/custom_expandable_text.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_shimmer.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_skills_model.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/roadmap_skills_cubit/road_map_skills_cubit.dart';

class RoadMapsDetailsView extends StatelessWidget {
  const RoadMapsDetailsView({super.key, required this.roadMapModel});

  final RoadMapModel roadMapModel;
//!******************************  هي الواجهة بشككل مبدأي ابو سلمان منرجع منعدلها 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const CustomBackButton2(),
      ),
      backgroundColor: darkPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(size.width * horizintalMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: size.height * 0.23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: CachedNetworkImage(
                              width: size.width,
                              imageUrl: roadMapModel.cover!,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Image.asset(
                                AssetsData.placeHolderImg,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(roadMapModel.title!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        Text('12h 56min  •  22 Lessons',
                            style: TextStyle(color: Colors.grey[600])),
                        CustomExpandableText(content: roadMapModel.description)
                      ],
                    ),
                    Container(
                      color: darkPrimaryColor,
                      padding: EdgeInsets.all(size.width * horizintalMargin),
                      child: Column(
                        children: [
                          BlocBuilder<RoadMapSkillsCubit, RoadMapSkillsState>(
                            builder: (context, state) {
                              if (state is RoadMapSkillsLoaded) {
                                List<RoadMapSkillsModel> skills = state.skills;
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: skills.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return _detailTile(
                                        skills[index].title!,
                                        "Skill $index describtion",
                                        Icons.play_circle_fill,
                                        Colors.red);
                                  },
                                );
                              } else if (state is RoadMapSkillsFailure) {
                                return const Center(child: Text("failed"));
                              } else {
                                //! منرجع منزبط الشيمر على كيفنا 
                                return HomeShimmer(size: size);
                              }
                            },
                          ),
                          // _detailTile('Course Preview', '4 • 2 Free Videos',
                          //     , ),
                          // _detailTile('Introduction', '8 Minutes',
                          //     Icons.lock_open, Colors.green),
                          // _detailTile('Ideation', '23 Minutes', Icons.lock,
                          //     Colors.grey),
                          // _detailTile('Ideation & Brainstorming', '45 Minutes',
                          //     Icons.lock, Colors.grey),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // _buildSwipeButton(),
        ],
      ),
    );
  }

  Widget _detailTile(
      String title, String subtitle, IconData icon, Color iconColor) {
    return ListTile(
      tileColor: Colors.black,
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
      trailing: const Icon(Icons.play_circle_outline, color: Colors.white),
    );
  }
}
