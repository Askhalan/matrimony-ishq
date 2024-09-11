// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/core/common/widgets/accordian/accordian.dart';
import 'package:ishq/core/common/widgets/accordian/w_accodian_header.dart';
import 'package:ishq/core/common/widgets/accordian/w_accodian_icon.dart';
import 'package:ishq/core/common/widgets/accordian/w_accordian_item.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class EditProfileOtherDetails extends StatelessWidget {
  EditProfileOtherDetails({
    super.key,
  });
  final user = CurrentUser();
  final userPref = CurrentUserPreferences();
  @override
  Widget build(BuildContext context) {
    return JAccordian(
      children: [
        //----------------------- IMPORTANT -----------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title:JTexts.important),
            content: Column(
              children: [
                JAcoordianItem(label: JTexts.Height, value: "145 cm"),
                JAcoordianItem(label:  JTexts.Country, value: user.country!),
                JAcoordianItem(label:  JTexts.State, value: user.state!),
                JAcoordianItem(label:  JTexts.City, value: user.city!),
                JAcoordianItem(label: JTexts.physicallyChallenged, value: user.physicalStatus!),

                JGap(),
                ElevatedButton(onPressed: () {}, child: Text('Edit'))
              ],
            )),

        //---------------------- PROFESSIONAL ---------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: JTexts.professional),
            content: Column(
              children: [
                JAcoordianItem(label:JTexts.Education, value: user.education!),
                JAcoordianItem(label: JTexts.College, value: user.college!),
                JAcoordianItem(label: JTexts.EmployedIn, value: user.employedIn!),
                JAcoordianItem(label: JTexts.Occupation, value: user.occupation!),
                JAcoordianItem(
                    label: JTexts.organization, value: user.organization!),
                     JGap(),
                ElevatedButton(onPressed: () {}, child: Text(JTexts.edit))
              ],
            )),

        //------------------------- FAMILY ------------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: JTexts.family),
            content: Column(
              children: [
                JAcoordianItem(label: JTexts.FAMILY_TYPE, value: user.familyType!),
                JAcoordianItem(label: JTexts.FAMILY_STATUS, value: user.familyStatus!),
                JAcoordianItem(label: JTexts.FAMILY_VALUES, value: user.familyValues!),
                JAcoordianItem(label:  JTexts.FAMILY_DETAILS, value: user.familyAbout!),
                 JGap(),
                ElevatedButton(onPressed: () {}, child: Text(JTexts.edit))
              ],
            )),

        //------------------------INTERERSTS ----------------------

        // AccordionSection(
        //     leftIcon: JAccordianIcon(icon: Iconsax.document),
        //     header: JAccordianHeader(title: "Interests"),
        //     content: Column(
        //       children: [
        //         JAcoordianItem(label: "Height", value: "145 cm"),
        //       ],
        //     )),

        //----------------------- LIFE STYLE ----------------------

        // AccordionSection(
        //     leftIcon: JAccordianIcon(icon: Iconsax.document),
        //     header: JAccordianHeader(title: "Life Style"),
        //     content: Column(
        //       children: [
        //         JAcoordianItem(label: "Height", value: "145 cm"),

        //       ],
        //     )),
      ],
    );
  }
}
