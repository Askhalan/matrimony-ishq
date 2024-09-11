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

class FamilyDetailsProcessingBtns extends StatelessWidget {
  const FamilyDetailsProcessingBtns({
    super.key,
    required this.familyValues,
    required this.familyType,
    required this.familyStatus,
    required this.familyAboutController,
  });

  final String familyValues;
  final String familyType;
  final String familyStatus;
  final TextEditingController familyAboutController;

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
                if (JValidator.validateFamilyDetails(
                    value: familyValues,
                    type: familyType,
                    status: familyStatus,
                    about: familyAboutController.text)) {
                  context
                      .read<ProfileBloc>()
                      .add(AddFamilyDetails(
                        familyValues: familyValues,
                        familyStatus: familyStatus,
                        familyType: familyType,
                        familyAbout: familyAboutController.text,
                      ));
                  Navigator.pushNamed(
                      context, Routes.addProfileImgScn);
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
