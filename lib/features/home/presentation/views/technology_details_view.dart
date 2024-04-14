import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/widgets/custom_sliver_app_bar.dart';
import '../../../../core/utils/assets_data.dart';

class TechnologyDetailsView extends StatelessWidget {
  const TechnologyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: darkPrimaryColor,
      height: size.height,
      child: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppBar(
                  size: size,
                  img: AssetsData.techDetailsImg,
                  title: "FrontEnd"),
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                    height: (size.height * (0.13)) * (5.56), width: size.width)
              ]))
            ],
          ),
          Positioned.fill(
            top: size.width * 0.5,
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * horizintalMargin),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: darkPrimaryColor,
                boxShadow: [
                  BoxShadow(
                      color: lightPrimaryColor,
                      offset: Offset(0.0, 0.1), //(x,y)
                      blurRadius: 3.0)
                ],
              ),
              child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: AppBar(
                      surfaceTintColor: Colors.transparent,
                      toolbarHeight: size.height * 0.015,
                      leading: Container(),
                      flexibleSpace: const TabBar(
                          indicatorColor: Colors.white,
                          dividerColor: lightPrimaryColor,
                          labelColor: Colors.white,
                          unselectedLabelColor: lightPrimaryColor,
                          physics: BouncingScrollPhysics(),
                          tabs: [
                            Tab(
                              text: "About",
                            ),
                            Tab(
                              text: "FrameWorks",
                            ),
                          ]),
                      backgroundColor: darkPrimaryColor,
                    ),
                    body: SingleChildScrollView(
                      child: SizedBox(
                        height: size.height,
                        child: TabBarView(children: [
                          const SizedBox(
                            height: 20,
                            child: Text("kfndgn"),
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  CustomCard2(size: size),
                                ],
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                  )),
            ),
          )
        ],
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
