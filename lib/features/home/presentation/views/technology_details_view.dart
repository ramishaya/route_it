import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_styles.dart';
import 'package:route_it/core/widgets/custom_back_button2.dart';
import 'package:route_it/core/widgets/custom_expandable_text.dart';
import 'package:route_it/core/widgets/custom_sliver_app_bar.dart';
import 'package:route_it/features/home/data/models/technology_category_model.dart';
import 'package:route_it/features/home/presentation/views/widgets/grid_cards_builder.dart';
import '../../../../core/utils/assets_data.dart';

class TechnologyDetailsView extends StatelessWidget {
  const TechnologyDetailsView(
      {super.key, required this.technologyCategoryModel});
  final TechnologyCategoryModel technologyCategoryModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const CustomBackButton2(),
        title: Text(
          technologyCategoryModel.name!,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * horizintalMargin,
            vertical: size.width * horizintalMargin),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description",
                style: TextStyle(fontSize: MyTextStyles.titleSize),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomExpandableText(
                content: technologyCategoryModel.description,
              ),
              const Text(
                "FrameWorks",
                style: TextStyle(fontSize: MyTextStyles.titleSize),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: size.width * 0.90,
                        height: size.height * 0.32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: darkPrimaryColor,
                            border: Border.all(
                                color: const Color(0xFFFFFFFF), width: 0.3)),
                        child:
                            //height: size.height * 0.15,
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.all(size.width * horizintalMargin),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "React",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "${"React is a FrontEnd framework , it is a good frame work bla bla bla bla bla".split(' ').take(6).join(' ')}....",
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image.asset(
                                    AssetsData.reactImg,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  )),
                            ),
                          ],
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard2 extends StatelessWidget {
  const CustomCard2({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.width * horizintalMargin),
      height: size.height * 0.3,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Flutter",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 40),
              ),
              const Text(
                "Cross Platform Frame Work..",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Let's Start",
                    style: TextStyle(
                        color: lightPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Iconsax.play,
                      color: lightPrimaryColor,
                      size: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
