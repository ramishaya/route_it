import 'package:flutter/material.dart';
import 'package:route_it/core/utils/constants/constants_numbers.dart';
import 'package:route_it/core/utils/helpers/helper_functions.dart';
import 'package:route_it/core/widgets/custom_back_button2.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it/features/roadmaps/presentation/views/roadmaps_details_view/widgets/roadmap_details_images.dart';
import 'package:route_it/features/roadmaps/presentation/views/roadmaps_details_view/widgets/roadmap_skills.dart';

class RoadMapsDetailsView extends StatelessWidget {
  const RoadMapsDetailsView({super.key, required this.roadMapModel});

  final RoadMapModel roadMapModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton2(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(
                    HelperFunctions.screenWidth(context) * horizintalMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(roadMapModel.title!,
                        style: Theme.of(context).textTheme.headlineLarge),
                    RoadMapDetailsImages(roadMapModel: roadMapModel),
                    RoadMapSkills(roadMapModel: roadMapModel,)
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
}
