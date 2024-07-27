import 'package:flutter/material.dart';

class JGap10 extends StatelessWidget {
   const JGap10({
    super.key, this.h=10,  this.w =10,
  });

final double h;
final double w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height:h,width: w,);
  }
}