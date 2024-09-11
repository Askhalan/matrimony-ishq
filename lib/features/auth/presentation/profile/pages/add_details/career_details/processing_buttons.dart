// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/widgets/snackbar/error_snackbar.dart';
import 'package:ishq/core/common/widgets/snackbar/show_snackbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/validators/validation.dart';

class ProcessingButtons extends StatelessWidget {
  const ProcessingButtons({
    super.key,
    required this.education,
    required this.employedIn,
    required this.occupation,
    required this.collegeController,
    required this.organizationController,
  });

  final String education;
  final String employedIn;
  final String occupation;
  final TextEditingController collegeController;
  final TextEditingController organizationController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
        ),
        JGap(),
        Flexible(
          flex: 4,
          child: ElevatedButton(
              onPressed: () {
                if (JValidator.validateProfessionalDetails(
                  education: education,
                  employedIn: employedIn,
                  occupation: occupation,
                )) {
                  context.read<ProfileBloc>().add(AddProfessionalDetails(
                      education: education,
                      college: collegeController.text,
                      employedIn: employedIn,
                      occupation: occupation,
                      organization: organizationController.text));
                  Navigator.pushNamed(context, Routes.addFamilyDetailsScn);
                } else {
                  showSnackBar(
                      context,
                      ErrorSnackBar(
                        message: JTexts.fillAllFieldsMsg,
                      ));
                }
              },
              child: Text(JTexts.next)),
        ),
      ],
    );
  }
}
