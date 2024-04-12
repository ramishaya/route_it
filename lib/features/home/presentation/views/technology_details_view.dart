import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/features/home/presentation/views/widgets/custom_sliver_app_bar.dart';
import '../../../../core/utils/assets_data.dart';

class TechnologyDetailsView extends StatelessWidget {
  const TechnologyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: darkPrimaryColor,
      extendBodyBehindAppBar: true,
      body:  CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(size: size ,  img: AssetsData.techDetailsImg , title : "FrontEnd"),
          
        ],
      )
    );
  }
}
