// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/form/dropdown.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/common/widgets/form/dob_picker.dart';
import 'package:ishq/features/auth/presentation/profile/pages/add_details/basic_details/w_processing_button.dart';
import 'package:ishq/features/auth/presentation/profile/widgets/gender_chip.dart';
import 'package:ishq/features/auth/presentation/profile/widgets/progress_indicator.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/validators/validation.dart';

class ScnBasicDetails extends StatefulWidget {
  const ScnBasicDetails({super.key});

  @override
  _ScnBasicDetailsState createState() => _ScnBasicDetailsState();
}

class _ScnBasicDetailsState extends State<ScnBasicDetails> {
  final nameController = TextEditingController();
  String physicalStatus = "";
  String profileFor = "";
  String selectedGender = "";
  String maritalStatus = '';
  DateTime? selectedDate;
  GlobalKey formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        flexibleSpaceContent: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: JSize.defaultPadding * 3,
              child: SignupProgressIndicator(
                step: 3,
              ),
            ),
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
                  //------------------------------------- PROFILE FOR -------------------------------------
                  JDropdown(
                    selectedItem: profileFor,
                    items: ['Myself', 'Son', 'Daughter'],
                    title: "Profile created for",
                    onItemSelected: (value) {
                      setState(() {
                        profileFor = value;
                      });
                    },
                  ),

                  JGap(),

                  //----------------------------------------- NAME ----------------------------------------

                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: JTexts.name,
                    ),
                    validator: (value) =>
                        JValidator.validateEmptyText(JTexts.name, value),
                  ),
                  JGap(),

                  //---------------------------------------- GENDER ---------------------------------------

                  GenderChip(
                    selectedGender: selectedGender,
                    onItemSelected: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  JGap(),

                  //------------------------------------------ DOB ----------------------------------------

                  DobPicker(
                    selectedDate: selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                  JGap(),

                  //------------------------------------- MARITAL STATUS -----------------------------------
                  JDropdown(
                    selectedItem: maritalStatus,
                    items: const ['Never Maried', 'Divorsed', 'Widow'],
                    title: "Marital Status",
                    onItemSelected: (value) {
                      maritalStatus = value;
                    },
                  ),
                  JGap(),

                  //---------------------------------- PHYSICALLY CHALLENGED ------------------------------

                  JDropdown(
                    selectedItem: physicalStatus,
                    items: ['Yes', 'No'],
                    title: "Physically Challenged",
                    onItemSelected: (value) {
                      setState(() {
                        physicalStatus = value;
                      });
                    },
                  ),
                  JGap(h: JSize.spaceBtwSections * 3),

                  //-------------------------------------- NEXT BUTTON ------------------------------------

                  BasicDetailsProcessButton(
                      physicalStatus: physicalStatus,
                      profileFor: profileFor,
                      selectedGender: selectedGender,
                      maritalStatus: maritalStatus,
                      selectedDate: selectedDate,
                      nameController: nameController),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

