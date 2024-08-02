// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class SectionWraperContainer extends StatelessWidget {
  const SectionWraperContainer({
    super.key, required this.children,

  });

 
 final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: JSize.defaultPaddingValue * 0.5,
          vertical: JSize.defaultPaddingValue * 0.5),
      decoration: BoxDecoration(
          border:
              Border.all(width: 0.5, color: JColor.borderSecondary),
          borderRadius: BorderRadius.circular(JSize.borderRadLg)),
      child: Column(
        children: children
      ),
    );
  }
}
