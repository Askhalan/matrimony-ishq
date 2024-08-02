// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class SettingsButtons extends StatelessWidget {
  SettingsButtons({
    super.key,
    required this.text,
    this.isFlexible = true,
    this.height = 80.0,
    this.icon,
    this.image,  this.isLabel=false,
    this.onTap
  });

  final String text;
  final bool isFlexible;
  final double height;
  final IconData? icon;
  final String? image;
  final bool isLabel;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: isFlexible ? 1 : 0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: height,
          decoration: BoxDecoration(
              color: JColor.white,
              boxShadow: [JColor.boxSHadow],
              borderRadius: BorderRadius.circular(JSize.borderRadLg)),
          child: Center(
              child: Text(
            text,
            style:isLabel ?Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.labelLarge,
          )),
        ),
      ),
    );
  }
}
