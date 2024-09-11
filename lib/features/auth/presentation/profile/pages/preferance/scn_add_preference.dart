import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/loader/button_loader.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/add/w_age_range.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/add/w_education.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/add/w_height_range.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/add/w_job.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/widgets/add/w_marital_status.dart';
import 'package:ishq/core/common/widgets/containers/w_section_wraper_container.dart';
import 'package:ishq/features/match/presentation/match/widgets/w_appbar_title.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ScnAddPreference extends StatefulWidget {
  const ScnAddPreference({super.key});

  @override
  State<ScnAddPreference> createState() => _ScnAddPreferenceState();
}

class _ScnAddPreferenceState extends State<ScnAddPreference> {
  SfRangeValues ageRange = SfRangeValues(18, 60);
  SfRangeValues heightRange = SfRangeValues(4.0, 7.0);
  final MultiSelectController<String> educationController =
      MultiSelectController();
  final MultiSelectController<String> jobController = MultiSelectController();
  final MultiSelectController<String> maritalStatusController =
      MultiSelectController<String>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is AddPreferencesSuccess) {
          Navigator.pushReplacementNamed(context, Routes.navigationMenu);
        }
      },
      child: Scaffold(
          body: JAppbar(
        title: AppbarTitle(
          title:JTexts.prefrences ,
          subtitle: JTexts.chooseYourHalf,
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
                    Text(JTexts.basicPrefrences,
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
                    Text(JTexts.professionalPrefrences,
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
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return ButtonLoader();
                    }
                    return ElevatedButton(
                        onPressed: () {
                          context.read<ProfileBloc>().add(AddPreferences(
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
                        child: Text(JTexts.AddPrefrences));
                  },
                ),
                JGap()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
