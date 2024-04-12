import 'package:flutter/material.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/core/utils/my_text_styles.dart';
import 'package:route_it/core/widgets/linear_gradient_container.dart';
import 'package:route_it/core/widgets/tech_category_builder.dart';
import 'package:route_it/features/home/presentation/views/widgets/custom_sliver_app_bar.dart';

class TechCategoryView extends StatelessWidget {
  const TechCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int itemCount = 4;
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: LinearGradientContainer(
            size: size,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomSliverAppBar(size: size ,  img: AssetsData.welcomeImg,  title: "Explore Technologies",),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * horizintalMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Deep Dive into Our RoadMaps",
                          style: TextStyle(fontSize: MyTextStyles.subTitleSize),
                        ),
                        SizedBox(
                          height: (size.height * (0.13)) * (itemCount + 1.4),
                          width: size.width,
                          child: TechCategoryBuilder(
                              itemCount: itemCount, size: size),
                        )
                      ],
                    ),
                  )
                ]))
              ],
            )));
  }
}
