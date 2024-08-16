import 'package:flutter/material.dart';
import 'package:ishq/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class JShimmerEffectAspectratio extends StatelessWidget {
  const JShimmerEffectAspectratio(
      {super.key, this.radius = 15, this.color, required this.aspectRatio});

  final double aspectRatio, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final isDark = JHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius), color: Colors.amber),
        ),
      ),
    );
  }
}
