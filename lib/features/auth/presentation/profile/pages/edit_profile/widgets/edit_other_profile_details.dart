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
            header: JAccordianHeader(title: "Important"),
            content: Column(
              children: [
                JAcoordianItem(label: "Height", value: "145 cm"),
                JAcoordianItem(label: "Country", value: user.country!),
                JAcoordianItem(label: "State", value: user.state!),
                JAcoordianItem(label: "City", value: user.city!),
                JAcoordianItem(label: "Physicaly Disabled", value: user.physicalStatus!),

                JGap(),
                ElevatedButton(onPressed: () {}, child: Text('Edit'))
              ],
            )),

        //---------------------- PROFESSIONAL ---------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: "Professional"),
            content: Column(
              children: [
                JAcoordianItem(label: "Education", value: user.education!),
                JAcoordianItem(label: "College", value: user.college!),
                JAcoordianItem(label: "Employed In", value: user.employedIn!),
                JAcoordianItem(label: "Occupation", value: user.occupation!),
                JAcoordianItem(
                    label: "Organization", value: user.organization!),
                     JGap(),
                ElevatedButton(onPressed: () {}, child: Text('Edit'))
              ],
            )),

        //------------------------- FAMILY ------------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: "Family"),
            content: Column(
              children: [
                JAcoordianItem(label: "Type", value: user.familyType!),
                JAcoordianItem(label: "Status", value: user.familyStatus!),
                JAcoordianItem(label: "Values", value: user.familyValues!),
                JAcoordianItem(label: "About", value: user.familyAbout!),
                 JGap(),
                ElevatedButton(onPressed: () {}, child: Text('Edit'))
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
