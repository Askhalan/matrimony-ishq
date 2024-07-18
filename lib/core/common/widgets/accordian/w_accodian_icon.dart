import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JAccordianIcon extends StatelessWidget {
  const JAccordianIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: JColor.secondary,
          borderRadius: BorderRadius.circular(JSize.borderRadLg)),
      child: Icon(
        icon,
        color: JColor.white,
        size: 25,
      ),
    );
  }
}