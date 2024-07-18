// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/accordian/accordian.dart';
import 'package:ishq/core/common/widgets/accordian/w_accodian_header.dart';
import 'package:ishq/core/common/widgets/accordian/w_accodian_icon.dart';
import 'package:ishq/core/common/widgets/accordian/w_accordian_item.dart';

class ProfileOtherDetails extends StatelessWidget {
  const ProfileOtherDetails({
    super.key,
  });

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
              ],
            )),

        //---------------------- PREFERENCE ----------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: "Preferance"),
            content: Column(
              children: [
                JAcoordianItem(label: "Height", value: "145 cm"),
              ],
            )),

        //----------------------- EDUCATION -----------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: "Education"),
            content: Column(
              children: [
                JAcoordianItem(label: "Height", value: "145 cm"),
              ],
            )),

        //------------------------- FAMILY ------------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: "Family"),
            content: Column(
              children: [
                JAcoordianItem(label: "Height", value: "145 cm"),
              ],
            )),

        //-------------------------- BODY -------------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: "Preferance"),
            content: Column(
              children: [
                JAcoordianItem(label: "Height", value: "145 cm"),
              ],
            )),

        //------------------------INTERERSTS ----------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: "Interests"),
            content: Column(
              children: [
                JAcoordianItem(label: "Height", value: "145 cm"),
              ],
            )),

        //----------------------- LIFE STYLE ----------------------

        AccordionSection(
            leftIcon: JAccordianIcon(icon: Iconsax.document),
            header: JAccordianHeader(title: "Life Style"),
            content: Column(
              children: [
                JAcoordianItem(label: "Height", value: "145 cm"),
              ],
            )),
      ],
    );
  }
}