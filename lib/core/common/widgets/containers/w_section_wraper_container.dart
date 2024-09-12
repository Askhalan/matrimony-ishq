

import 'package:flutter/material.dart';

import 'package:ishq/features/app/presentation/match/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/helpers/helper_functions.dart';

class SectionWraperContainer extends StatelessWidget {
  const SectionWraperContainer({
    super.key,
    required this.children,
    this.padingNeeded = true,
    this.headerNeeded = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.action = '',
    this.heading = '',
    this.onTap,
  });

  final List<Widget> children;
  final bool padingNeeded;
  final bool headerNeeded;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String action;
  final String heading;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final bool isDark = JHelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: JColor.borderSecondary),
          borderRadius: BorderRadius.circular(JSize.borderRadLg),
          boxShadow: [JColor.boxSHadow],
          color:isDark?JColor.dark : JColor.white
          ),
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
        children: [
          headerNeeded
              ? Container(
                  decoration: BoxDecoration(
                      color: JColor.secondary,
                      borderRadius: BorderRadius.circular(JSize.borderRadLg)),
                  child: JSectionLabel(
                    heading: heading,
                    onTap: onTap,
                    action: action,
                  ),
                )
              : SizedBox(),
          Padding(
            padding: padingNeeded
                ? EdgeInsets.symmetric(
                    horizontal: JSize.defaultPaddingValue * 0.5,
                    vertical: JSize.defaultPaddingValue * 0.5)
                : EdgeInsets.all(0),
            child: Column(
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
                children: children),
          ),
        ],
      ),
    );
  }
}
