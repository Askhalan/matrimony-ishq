// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/w_age_range.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/w_education.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/w_height_range.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/w_job.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/w_marital_status.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/w_section_wraper_container.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ScnAddPreference extends StatefulWidget {
  const ScnAddPreference({super.key});

  @override
  State<ScnAddPreference> createState() => _ScnAddPreferenceState();
}

class _ScnAddPreferenceState extends State<ScnAddPreference> {
  String ageStart = '';
  SfRangeValues ageRange = SfRangeValues(18, 60);
  SfRangeValues heightRange = SfRangeValues(4.0, 7.0);
  final MultiSelectController maritalStatusController = MultiSelectController();
  final MultiSelectController educationController = MultiSelectController();
  final MultiSelectController jobController = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: JAppbar(
      body: SingleChildScrollView(
        child: Padding(
          padding: JSize.defaultPadding * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              JGap(h: JSize.spaceBtwSections),
              SectionWraperContainer(
                children: [
                  Text("Basic Preference",
                      style: Theme.of(context).textTheme.labelLarge),
                  JGap10(),

                  //--------------------------------------- AGE ---------------------------------------

                  AgeRange(ageRange: ageRange),
                  JGap10(),

                  //-------------------------------------- HEIGHT -------------------------------------

                  HeightRangeSelector(heightRange: heightRange),
                  JGap10(),

                  //----------------------------------- MARITAL STATUS --------------------------------

                  MaritalStatus(controller: maritalStatusController),
                  JGap10(),
                ],
              ),
              JGap(h: JSize.spaceBtwSections),
              SectionWraperContainer(
                children: [
                  Text("Professional Preference",
                      style: Theme.of(context).textTheme.labelLarge),
                  JGap10(),

                  //------------------------------------- EDUCATION -----------------------------------

                  EducationPref(controller: educationController),
                  JGap10(),

                  //---------------------------------------- JOB --------------------------------------

                  JobPref(controller: jobController),
                  JGap10(),
                ],
              ),
              JGap(h: JSize.spaceBtwSections),
              ElevatedButton(
                  onPressed: () {
                    log(maritalStatusController.selectedOptions.first
                        .toString());
                    log(educationController.selectedOptions.first.toJson());
                    log(jobController.selectedOptions.first.toString());
                    log(ageRange.start.toString());
                    log(heightRange.start.toString());
                  },
                  child: Text('Add Preference')),
              JGap()
            ],
          ),
        ),
      ),
    ));
  }
}
