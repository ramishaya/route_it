import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/core/utils/app_styles.dart';

class HomeWelcomeCard extends StatelessWidget {
  const HomeWelcomeCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.047),
      decoration: BoxDecoration(
          color: lightPrimaryColor, borderRadius: BorderRadius.circular(curv)),
      child: Row(children: [
        Container(
          width: size.width * 0.28,
          height: size.height * 0.12,
          decoration: const BoxDecoration(
              color: lightPrimaryColor,
              image: DecorationImage(image: AssetImage(AssetsData.avatarImg))),
        ),
        SizedBox(width: size.width * 0.08),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("What would you like to learn today?",
                  style: GoogleFonts.lato(
                        fontSize: MyTextStyles.subTitleSize,
                        fontWeight : MyTextStyles.titleWeight
                        ),),
           
            ],
          ),
        )
      ]),
    );
  }
}
