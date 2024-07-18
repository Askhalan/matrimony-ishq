// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_print, library_private_types_in_public_api


import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar.dart';
import 'package:ishq/core/common/widgets/form/dropdown.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/common/widgets/form/dob_picker.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/Profile/presentation/widgets/gender_chip.dart';
import 'package:ishq/features/Profile/presentation/widgets/progress_indicator.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/validators/validation.dart';

class ScnBasicDetails extends StatefulWidget {
  const ScnBasicDetails({super.key});

  @override
  _ScnBasicDetailsState createState() => _ScnBasicDetailsState();
}

class _ScnBasicDetailsState extends State<ScnBasicDetails> {
  String challengedController = "";
  String profileForController = "";
  String selectedGender = "";
  final nameController = TextEditingController();
  String maritalStatusController = '';
   DateTime? selectedDate;

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
            child: Column(
              children: [
                JGap(
                  h: JSize.spaceBtwSections * 2,
                ),
                //------------------------------------- PROFILE FOR -------------------------------------
                Dropdown(
                  selectedItem: profileForController,
                  items: ['Myself', 'Son', 'Daughter'],
                  title: "Profile created for",
                  onItemSelected: (value) {
                    setState(() {
                      profileForController = value;
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

                GenderChip(selectedGender: selectedGender),
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

                 //------------------------------------- MARITAL STATUS -------------------------------------
                Dropdown(
                    selectedItem: maritalStatusController,
                    items: const ['Never Maried', 'Divorsed', 'Widow'],
                    title: "Marital Status", onItemSelected: (value) { maritalStatusController=value; },),
                JGap(),

                //---------------------------------- PHYSICALLY CHALLENGED ------------------------------

                Dropdown(
                  selectedItem: challengedController,
                  items: ['Yes', 'No'],
                  title: "Physically Challenged",
                  onItemSelected: (value) {
                    setState(() {
                      challengedController = value;
                    });
                  },
                ),
                JGap(h: JSize.spaceBtwSections * 3),

                //-------------------------------------- NEXT BUTTON ------------------------------------

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.addressDetailsScn);
                  },
                  child: Text(JTexts.next),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}