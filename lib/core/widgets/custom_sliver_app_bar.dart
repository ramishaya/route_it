import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/widgets/custom_shader_mask.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key, required this.size, required this.img, required this.title});

  final Size size;
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
      centerTitle: true,
      leading: InkWell(
        focusColor: lightPrimaryColor,
        borderRadius: BorderRadius.circular(70),
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
            imageUrl: img,
            width: size.width,
            height: size.height * 0.2),
      ),
    );
  }
}
