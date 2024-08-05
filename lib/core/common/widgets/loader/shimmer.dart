import 'package:flutter/material.dart';
import 'package:ishq/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class JShimmerEffect extends StatelessWidget {
  const JShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final isDark = JHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius),color: Colors.amber),
        ),);
  }
}
