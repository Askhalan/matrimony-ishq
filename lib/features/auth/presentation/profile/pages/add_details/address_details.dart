import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/snackbar/error_snackbar.dart';
import 'package:ishq/core/common/widgets/snackbar/show_snackbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/widgets/progress_indicator.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/validators/validation.dart';

class ScnAddressDetails extends StatelessWidget {
  final phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  ScnAddressDetails({super.key});

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
                step: 4,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: JSize.defaultPadding,
            child: BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is ProfileFailure) {
                  showSnackBar(context, ErrorSnackBar(message: "${state.error} So please re verify your data before submitting again"));
                  Navigator.pushNamed(context, Routes.basicDetailsScn);
                }
                if (state is ProfileSuccess) {
                  Navigator.pushNamed(context, Routes.navigationMenu);
                }
              },
              builder: (context, state) {
               
                return Column(
                  children: [
                    JGap(
                      h: JSize.spaceBtwSections * 2,
                    ),

                    //------------------------------------- PHONE NUMBER ------------------------------------

                    TextFormField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          hintText: JTexts.phoneNo,
                        ),
                        validator: (value) =>
                            JValidator.validateEmptyText(JTexts.name, value)),
                    JGap(),

                    //----------------------------------------- ADDRESS ---------------------------------------

                    CountryStateCityPicker(
                        country: countryController,
                        state: stateController,
                        city: cityController,
                        dialogColor: Color.fromARGB(255, 233, 233, 233),
                        textFieldDecoration: InputDecoration(
                            fillColor: JColor.secondary,
                            filled: true,
                            suffixIcon:
                                const Icon(Icons.arrow_downward_rounded),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none))),
                    JGap(),

                    JGap(
                      h: JSize.spaceBtwSections * 3,
                    ),

                    //---------------------------------------- NEXT BUTTON -------------------------------------

                    ElevatedButton(
                        onPressed: () {
                          context.read<ProfileBloc>().add(AddAddressDetails(
                                phoneNo: phoneNumberController.text,
                                country: countryController.text,
                                state: stateController.text,
                                city: cityController.text,
                              ));
                          context.read<ProfileBloc>().add(SaveUser());
                        },
                        child: Text(JTexts.done))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
