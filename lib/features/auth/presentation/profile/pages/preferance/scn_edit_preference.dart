// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/loader/button_loader.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/edit/w_edit_age_range.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/edit/w_edit_education.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/edit/w_edit_height_range.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/edit/w_edit_job.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/edit/w_edit_marital_status.dart';
import 'package:ishq/core/common/widgets/containers/w_section_wraper_container.dart';
import 'package:ishq/features/match/presentation/match/widgets/w_appbar_title.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
// import 'package:multi_dropdown/multi_dropdown.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';

class ScnEditPreference extends StatefulWidget {
  const ScnEditPreference({super.key});

  @override
  State<ScnEditPreference> createState() => _ScnEditPreferenceState();
}

class _ScnEditPreferenceState extends State<ScnEditPreference> {
  final userPref = CurrentUserPreferences();

  final MultiSelectController<String> educationController = MultiSelectController();
  final MultiSelectController<String> jobController = MultiSelectController();
  final MultiSelectController<String> maritalStatusController = MultiSelectController();
  
  SfRangeValues ageRange = SfRangeValues(
    DataHelper.safeParseInt(CurrentUserPreferences().ageStart, defaultValue: 18),
    DataHelper.safeParseInt(CurrentUserPreferences().ageEnd, defaultValue: 60),
  );

  SfRangeValues heightRange = SfRangeValues(
    DataHelper.safeParseDouble(CurrentUserPreferences().heightStart, defaultValue: 4.0),
    DataHelper.safeParseDouble(CurrentUserPreferences().heightEnd, defaultValue: 7.0),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is AddPreferencesSuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: JAppbar(
          title: AppbarTitle(
            title: 'Preference',
            subtitle: 'Choose your better half',
          ),
          expandedHeight: 0,
          body: SingleChildScrollView(
            child: Padding(
              padding: JSize.defaultPadding * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  JGap(h: JSize.spaceBtwSections),
                  SectionWraperContainer(
                    children: [
                      Text("Basic Preference", style: Theme.of(context).textTheme.labelLarge),
                      JGap10(),

                      //--------------------------------------- AGE ---------------------------------------
                      AgeRangeEdit(
                        ageRange: ageRange,
                        onRangeChanged: (newRange) {
                          setState(() {
                            ageRange = newRange;
                          });
                        },
                      ),
                      JGap10(),

                      //-------------------------------------- HEIGHT -------------------------------------
                      HeightRangeSelectorEdit(
                        heightRange: heightRange,
                        onRangeChanged: (newRange) {
                          setState(() {
                            heightRange = newRange;
                          });
                        },
                      ),
                      JGap10(),

                      //----------------------------------- MARITAL STATUS --------------------------------
                      MaritalStatusEdit(controller: maritalStatusController),
                      JGap10(),
                    ],
                  ),
                  JGap(h: JSize.spaceBtwSections),
                  SectionWraperContainer(
                    children: [
                      Text("Professional Preference", style: Theme.of(context).textTheme.labelLarge),
                      JGap10(),

                      //------------------------------------- EDUCATION -----------------------------------
                      EducationPrefEdit(controller: educationController),
                      JGap10(),

                      //---------------------------------------- JOB --------------------------------------
                      JobPrefEdit(controller: jobController),
                      JGap10(),
                    ],
                  ),
                  JGap(h: JSize.spaceBtwSections),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoading) {
                        return ButtonLoader();
                      }

                      log(ageRange.start.toString());
                      log(ageRange.end.toString());

                      return ElevatedButton(
                        onPressed: () {
                          context.read<ProfileBloc>().add(EditPreferences(
                            uid: CurrentUser().uid,
                            ageStart: ageRange.start.toString(),
                            ageEnd: ageRange.end.toString(),
                            heightStart: heightRange.start.toString(),
                            heightEnd: heightRange.end.toString(),
                            maritalStatusPref: maritalStatusController
                                .selectedItems
                                .map((item) => item.label)
                                .toList(),
                            educationPref: educationController.selectedItems
                                .map((item) => item.label)
                                .toList(),
                            jobPref: jobController.selectedItems
                                .map((item) => item.label)
                                .toList(),
                          ));
                        },
                        child: Text('Save New Preference'),
                      );
                    },
                  ),
                  JGap(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
