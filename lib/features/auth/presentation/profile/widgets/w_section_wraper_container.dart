// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class SectionWraperContainer extends StatelessWidget {
  const SectionWraperContainer({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> children;
 
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: JSize.defaultPaddingValue * 0.5,
          vertical: JSize.defaultPaddingValue * 0.5),
      decoration: BoxDecoration(
          // color: JColor.softGrey,
          border: Border.all(width: 0.8, color: JColor.borderSecondary),
          borderRadius: BorderRadius.circular(JSize.borderRadLg)),
      child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children),
    );
  }
}
