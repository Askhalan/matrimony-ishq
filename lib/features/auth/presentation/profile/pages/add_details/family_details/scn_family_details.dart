// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/form/dropdown.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/widgets/progress_indicator.dart';
import 'package:ishq/features/match/presentation/widgets/w_appbar_title.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/validators/validation.dart';

class ScnFamilyDetails extends StatefulWidget {
  const ScnFamilyDetails({super.key});

  @override
  _ScnFamilyDetails createState() => _ScnFamilyDetails();
}

class _ScnFamilyDetails extends State<ScnFamilyDetails> {
  final familyAboutController = TextEditingController();

  String familyValues = "";
  String familyType = "";
  String familyStatus = "";
  GlobalKey formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        flexibleSpaceContent: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
                padding: JSize.defaultPadding * 3,
                child: SignupProgressIndicator(step: 3)),
            AppbarTitle(title: JTexts.FAMILY_DETAILS)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: JSize.defaultPadding,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  JGap(
                    h: JSize.spaceBtwSections * 2,
                  ),
                  //------------------------------------- FAMILY VALUES -------------------------------------
                  JDropdown(
                    selectedItem: familyValues,
                    items: ['Liberal', 'Orthodox'],
                    title: JTexts.FAMILY_VALUES,
                    onItemSelected: (value) {
                      setState(() {
                        familyValues = value;
                      });
                    },
                  ),

                  JGap(),

                  //--------------------------------------- FAMILY TYPE ---------------------------------------

                  JDropdown(
                    selectedItem: familyType,
                    items: [
                      'Nuclear Family',
                      'Joint Family',
                      'Step Family',
                      'Extended Family'
                    ],
                    title: JTexts.FAMILY_TYPE,
                    onItemSelected: (value) {
                      setState(() {
                        familyType = value;
                      });
                    },
                  ),
                  JGap(),

                  //--------------------------------------- FAMILY STATUS -------------------------------------

                  JDropdown(
                    selectedItem: familyStatus,
                    items: [
                      'Middle Class',
                      'Upper Middle Class',
                      'Lower Class'
                    ],
                    title: JTexts.FAMILY_STATUS,
                    onItemSelected: (value) {
                      setState(() {
                        familyStatus = value;
                      });
                    },
                  ),
                  JGap(),

                  //---------------------------------------- ABOUT FAMILY ---------------------------------------

                  TextFormField(
                    maxLines: 4,
                    controller: familyAboutController,
                    decoration: InputDecoration(
                      hintText: JTexts.ABOUT_FAMILY,
                    ),
                    validator: (value) => JValidator.validateEmptyText(
                        JTexts.ABOUT_FAMILY, value),
                  ),

                  JGap(h: JSize.spaceBtwSections * 5),

                  //-------------------------------------- NEXT BUTTON ------------------------------------

                  ElevatedButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(AddFamilyDetails(
                              familyValues: familyValues,
                              familyStatus: familyStatus,
                              familyType: familyType,
                              familyAbout: familyAboutController.text,
                            ));
                        Navigator.pushNamed(
                            context, Routes.addProfileImgScn);
                      },
                      child: Text(JTexts.next))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
