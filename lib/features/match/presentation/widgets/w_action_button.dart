import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JActionButton extends StatelessWidget {
  const JActionButton({super.key, this.color = JColor.white, this.icon, this.onTap});
  final Color color;
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 18),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(JSize.borderRadLg)),
        child: Center(
            child: Icon(
          icon,
          size: 25,
        )),
      ),
    );
  }
}