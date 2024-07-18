import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JGap2 extends StatelessWidget {
   const JGap2({
    super.key, this.h=JSize.defaultSpace2,  this.w =JSize.defaultSpace2,
  });

final double h;
final double w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height:h,width: w,);
  }
}