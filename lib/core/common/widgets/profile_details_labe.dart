import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/helpers/helper_functions.dart';

class ProfileDetailsLabel extends StatelessWidget {
  const ProfileDetailsLabel({
    super.key,
    required this.text,
    required this.icon,
    this.isThemeNeede = false,
  });
  final String text;
  final IconData icon;
  final bool isThemeNeede;
  @override
  Widget build(BuildContext context) {
    final bool isDark = JHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: isThemeNeede
              ? isDark
                  ? JColor.light
                  : JColor.dark
              : JColor.light,
        ),
        JGap(w: 5),
        Text(
          text,
          style: isThemeNeede
              ? Theme.of(context).textTheme.bodyLarge
              : Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: JColor.light),
        ),
      ],
    );
  }
}
