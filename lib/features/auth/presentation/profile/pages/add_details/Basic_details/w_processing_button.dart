import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/widgets/snackbar/error_snackbar.dart';
import 'package:ishq/core/common/widgets/snackbar/show_snackbar.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';
import 'package:ishq/utils/validators/validation.dart';

class BasicDetailsProcessButton extends StatelessWidget {
  const BasicDetailsProcessButton({
    super.key,
    required this.physicalStatus,
    required this.profileFor,
    required this.selectedGender,
    required this.maritalStatus,
    required this.selectedDate,
    required this.nameController,
  });

  final String physicalStatus;
  final String profileFor;
  final String selectedGender;
  final String maritalStatus;
  final DateTime? selectedDate;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //--- validaton
        bool basicDetailsValidated = JValidator.areFormFieldsFilled(
          physicalStatus: physicalStatus,
          profileFor: profileFor,
          selectedGender: selectedGender,
          maritalStatus: maritalStatus,
          selectedDate: selectedDate,
        );

        //Checking if validated and processing
        if (basicDetailsValidated) {
          context.read<ProfileBloc>().add(AddBasicDetails(
                profileFor: profileFor,
                name: nameController.text,
                gender: selectedGender,
                dob: DataHelper.calculateAge(selectedDate!).toString(),
                maritalStatus: maritalStatus,
                physicalStatus: physicalStatus,
              ));

          //if everything was fine then navigating to the next page
          Navigator.pushNamed(
            context,
            Routes.addressDetailsScn,
          );
        } else {
          showSnackBar(
              context,
              ErrorSnackBar(
                message:JTexts.fillAllFieldsMsg,
              ));
        }
      },
      child: Text(JTexts.next),
    );
  }
}
