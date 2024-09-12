import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/loader/shimmer.dart';
import 'package:ishq/utils/constants/sizes.dart';

class VerticalUserCardLoader extends StatelessWidget {
  const VerticalUserCardLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 15),
      child: JShimmerEffect(
          width: JSize.vUserCardWidth,
          height: JSize.vUserCardHeight),
    );
  }
}
