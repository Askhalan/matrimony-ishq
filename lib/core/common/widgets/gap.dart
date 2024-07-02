import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JGap extends StatelessWidget {
   JGap({
    super.key, this.h=JSize.defaultSpace,  this.w =JSize.defaultSpace,
  });

final double h;
final double w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height:h,width: w,);
  }
}