import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
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
  final formKey = GlobalKey<FormState>();

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
              child: Form(
                key: formKey, // Attach the form key here
                child: Column(
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
                          JValidator.validatePhoneNumber(value),
                    ),
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
                      h: JSize.spaceBtwSections * 7,
                    ),

                    //---------------------------------------- NEXT BUTTON -------------------------------------

                    Row(
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
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<ProfileBloc>()
                                      .add(AddAddressDetails(
                                        phoneNo: phoneNumberController.text,
                                        country: countryController.text,
                                        state: stateController.text,
                                        city: cityController.text,
                                      ));
                                  Navigator.pushNamed(context,
                                      Routes.addProfessionalDetailsScn);
                                }
                              },
                              child: Text(JTexts.next)),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
