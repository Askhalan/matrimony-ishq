import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/loader/shimmer.dart';

class TopMatchCardLoader extends StatelessWidget {
  const TopMatchCardLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: JShimmerEffect(width: 300, height: 200),
    );
  }
}
