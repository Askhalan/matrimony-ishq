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

class ScnProfessionalDetails extends StatefulWidget {
  const ScnProfessionalDetails({super.key});

  @override
  _ScnProfessionalDetails createState() => _ScnProfessionalDetails();
}

class _ScnProfessionalDetails extends State<ScnProfessionalDetails> {
  final collegeController = TextEditingController();
  final organizationController = TextEditingController();
  String physicalStatus = "";
  String education = "";
  String employedIn = "";
  String occupation = "";
  // SfRangeValues incomeRange = SfRangeValues(1, 100);
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
            AppbarTitle(title: JTexts.PROFESSIONAL_DETAILS)
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
                  //------------------------------------- EDUCATION -------------------------------------
                  JDropdown(
                    selectedItem: education,
                    items: ['B-Tech', 'Degree', 'MBBS'],
                    title: JTexts.EDUCATION,
                    onItemSelected: (value) {
                      setState(() {
                        education = value;
                      });
                    },
                  ),

                  JGap(),

                  //--------------------------------------- COLLEGE ---------------------------------------

                  TextFormField(
                    controller: collegeController,
                    decoration: InputDecoration(
                      hintText: JTexts.COLLEGE,
                    ),
                    validator: (value) =>
                        JValidator.validateEmptyText(JTexts.COLLEGE, value),
                  ),
                  JGap(),

                  //--------------------------------------- EMPLOYED IN -------------------------------------

                  JDropdown(
                    selectedItem: employedIn,
                    items: ['Private Sector', 'Civil Service', ''],
                    title: JTexts.EMPLOYED_IN,
                    onItemSelected: (value) {
                      setState(() {
                        employedIn = value;
                      });
                    },
                  ),
                  JGap(),

                  //---------------------------------------- OCCUPATION ---------------------------------------

                  JDropdown(
                    selectedItem: occupation,
                    items: ['Doctor', 'Designer', 'Engineer'],
                    title: JTexts.OCUUPATION,
                    onItemSelected: (value) {
                      setState(() {
                        occupation = value;
                      });
                    },
                  ),
                  JGap(),

                  //---------------------------------------- ORGANIZATION --------------------------------------

                  TextFormField(
                    controller: organizationController,
                    decoration: InputDecoration(
                      hintText: JTexts.ORGANIZATION,
                    ),
                    validator: (value) => JValidator.validateEmptyText(
                        JTexts.ORGANIZATION, value),
                  ),
                  JGap(),

                  //---------------------------------------- ANNUAL INCOME --------------------------------------

                  // IncomeRange(incomeRange:incomeRange,),
                  JGap(h: JSize.spaceBtwSections * 3),

                  //-------------------------------------- NEXT BUTTON ------------------------------------

                  ElevatedButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(AddProfessionalDetails(
                            education: education,
                            college: collegeController.text,
                            employedIn: employedIn,
                            occupation: occupation,
                            organization: organizationController.text));
                        Navigator.pushNamed(context, Routes.addFamilyDetailsScn);
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
