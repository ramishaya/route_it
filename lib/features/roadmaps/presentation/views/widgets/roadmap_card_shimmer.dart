
import 'package:flutter/material.dart';
import 'package:route_it/constants.dart';
import 'package:shimmer/shimmer.dart';

class RoadMapCardShimmer extends StatelessWidget {
  const RoadMapCardShimmer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.only(
                    bottom: size.width * horizintalMargin),
                width: size.width,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              );
            }),
          ),
        ],
      ),
    );
  }
}
