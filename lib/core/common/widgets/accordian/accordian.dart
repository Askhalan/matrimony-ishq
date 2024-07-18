import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JAccordian extends StatelessWidget {
  const JAccordian({
    super.key,
    required this.children,
  });
  final List<AccordionSection> children;
  @override
  Widget build(BuildContext context) {
    return Accordion(
        headerBorderWidth: 1,
        headerBorderColor: JColor.grey,
        headerBackgroundColor: Colors.transparent,
        headerBackgroundColorOpened: JColor.softGrey,
        contentBackgroundColor: JColor.softGrey,
        contentBorderColor: JColor.softGrey,
        contentVerticalPadding: 20,
        contentHorizontalPadding: 25,
        paddingBetweenClosedSections:20,
        paddingBetweenOpenSections: 20,
        rightIcon: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: JColor.light),
              borderRadius: BorderRadius.circular(JSize.borderRadLg)),
          child: const Icon(
            Icons.arrow_outward_rounded,
            color: Colors.black54,
            size: 25,
          ),
        ),
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        sectionOpeningHapticFeedback: SectionHapticFeedback.light,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: children);
  }
}