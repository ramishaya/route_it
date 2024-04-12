import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/core/widgets/custom_shader_mask.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text(
        "Explore Technologies",
        style: TextStyle(fontSize: 25),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: GoRouter.of(context).pop,
        child: const Icon(
          Iconsax.arrow_left_24,
          size: 30,
          color: Colors.white,
        ),
      ),
      backgroundColor: darkPrimaryColor,
      expandedHeight: size.height * 0.23,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
        background: CustomShaderMasK(
            fadeInColor: darkPrimaryColor,
            imageUrl: AssetsData.welcomeImg,
            width: size.width,
            height: size.height * 0.2),
      ),
    );
  }
}
