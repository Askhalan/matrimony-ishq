// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/core/common/widgets/accordian/accordian.dart';
import 'package:ishq/core/common/widgets/accordian/w_accodian_header.dart';
import 'package:ishq/core/common/widgets/accordian/w_accodian_icon.dart';
import 'package:ishq/core/common/widgets/accordian/w_accordian_item.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class ProfileOtherDetails extends StatelessWidget {
  ProfileOtherDetails({
    super.key,
  });
  final user = CurrentUser();
  final userPref = CurrentUserPreferences();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is AddPreferencesSuccess) {
          return JAccordian(
            children: [
              //----------------------- IMPORTANT -----------------------

              AccordionSection(
                  leftIcon: JAccordianIcon(icon: Iconsax.document),
                  header: JAccordianHeader(title: JTexts.important),
                  content: Column(
                    children: [
                      JAcoordianItem(label: JTexts.Height, value: "145 cm"),
                      JAcoordianItem(label: JTexts.Country, value: user.country!),
                      JAcoordianItem(label:JTexts.State, value: user.state!),
                      JAcoordianItem(label: JTexts.City, value: user.city!),
                      JAcoordianItem(
                          label: JTexts.physicallyChallenged,
                          value: user.physicalStatus!),
                    ],
                  )),

              //---------------------- PREFERENCE ----------------------

              AccordionSection(
                  leftIcon: JAccordianIcon(icon: Iconsax.document),
                  header: JAccordianHeader(title: JTexts.prefrences),
                  content: Column(
                    children: [
                      JAcoordianItem(
                          label: JTexts.age,
                          value:
                              '${userPref.ageStart!.substring(0, 2)}-${userPref.ageEnd!.substring(0, 2)} Yrs'),
                      JAcoordianItem(
                          label: JTexts.Height,
                          value:
                              '${userPref.heightStart}ft -${userPref.heightEnd}ft'),
                      JAcoordianItem(
                          label: JTexts.job, value: userPref.jobPref!.join(',')),
                      JAcoordianItem(
                          label: JTexts.Education,
                          value: userPref.educationPref!.join(',')),
                      JAcoordianItem(
                          label: JTexts.maritalStatus,
                          value: userPref.maritalStatusPref!.join(',')),
                    ],
                  )),

              //---------------------- PROFESSIONAL ---------------------

              AccordionSection(
                  leftIcon: JAccordianIcon(icon: Iconsax.document),
                  header: JAccordianHeader(title: JTexts.professional),
                  content: Column(
                    children: [
                      JAcoordianItem(
                          label: JTexts.Education, value: user.education!),
                      JAcoordianItem(label: JTexts.College, value: user.college!),
                      JAcoordianItem(
                          label: JTexts.EmployedIn, value: user.employedIn!),
                      JAcoordianItem(
                          label: JTexts.Occupation, value: user.occupation!),
                      JAcoordianItem(
                          label: JTexts.organization, value: user.organization!),
                    ],
                  )),

              //------------------------- FAMILY ------------------------

              AccordionSection(
                  leftIcon: JAccordianIcon(icon: Iconsax.document),
                  header: JAccordianHeader(title: JTexts.family),
                  content: Column(
                    children: [
                      JAcoordianItem(label:JTexts.FAMILY_TYPE, value: user.familyType!),
                      JAcoordianItem(
                          label: JTexts.FAMILY_STATUS, value: user.familyStatus!),
                      JAcoordianItem(
                          label: JTexts.FAMILY_VALUES, value: user.familyValues!),
                      JAcoordianItem(label: JTexts.family, value: user.familyAbout!),
                    ],
                  )),
            ],
          );
        }
        return JAccordian(
          children: [
            //----------------------- IMPORTANT -----------------------

            AccordionSection(
                leftIcon: JAccordianIcon(icon: Iconsax.document),
                header: JAccordianHeader(title:JTexts.important),
                content: Column(
                  children: [
                    JAcoordianItem(label: "Height", value: "145 cm"),
                    JAcoordianItem(label: "Country", value: user.country!),
                    JAcoordianItem(label: "State", value: user.state!),
                    JAcoordianItem(label: "City", value: user.city!),
                    JAcoordianItem(
                        label: "Physicaly Disabled",
                        value: user.physicalStatus!),
                  ],
                )),

            //---------------------- PREFERENCE ----------------------

            AccordionSection(
                leftIcon: JAccordianIcon(icon: Iconsax.document),
                header: JAccordianHeader(title: "Preferance"),
                content: Column(
                  children: [
                    JAcoordianItem(
                        label: "Age",
                        value:
                            '${userPref.ageStart!.substring(0, 2)}-${userPref.ageEnd!.substring(0, 2)} Yrs'),
                    JAcoordianItem(
                        label: "Height",
                        value:
                            '${userPref.heightStart}ft -${userPref.heightEnd}ft'),
                    JAcoordianItem(
                        label: "Job", value: userPref.jobPref!.join(',')),
                    JAcoordianItem(
                        label: "Education",
                        value: userPref.educationPref!.join(',')),
                    JAcoordianItem(
                        label: "Marital Status ",
                        value: userPref.maritalStatusPref!.join(',')),
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
                    JAcoordianItem(
                        label: "Employed In", value: user.employedIn!),
                    JAcoordianItem(
                        label: "Occupation", value: user.occupation!),
                    JAcoordianItem(
                        label: "Organization", value: user.organization!),
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
      },
    );
  }
}
