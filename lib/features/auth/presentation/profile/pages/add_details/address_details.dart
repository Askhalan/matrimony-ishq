import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/widgets/appbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/pages/add_details/basic_details.dart';
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

  @override
  Widget build(BuildContext context) {
    final BasicDetailsArgs basicDetails =
        ModalRoute.of(context)!.settings.arguments as BasicDetailsArgs;
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
               if(state is ProfileSuccess){
                Navigator.pushNamed(context, Routes.navigationMenu);
               }
              },
              builder: (context, state) {
                 if(state is ProfileLoading){
                return Center(child: CircularProgressIndicator());
               }
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
                          context.read<ProfileBloc>().add(SaveUser(
                              uid: FirebaseAuth.instance.currentUser!.uid,
                              profileFor: basicDetails.profileFor,
                              name: basicDetails.name,
                              gender: basicDetails.gender,
                              dob: basicDetails.dob,
                              maritalStatus: basicDetails.maritalStatus,
                              email: '',
                              physicalStatus: basicDetails.physicalStatus,
                              phoneNo: phoneNumberController.text,
                              country: countryController.text,
                              state: stateController.text,
                              city: cityController.text,
                              bio: '',
                              profileImage: ''));
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
