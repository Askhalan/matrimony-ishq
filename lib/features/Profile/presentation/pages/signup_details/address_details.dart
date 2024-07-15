import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar.dart';
import 'package:ishq/core/common/widgets/gap.dart';
import 'package:ishq/features/Profile/presentation/widgets/progress_indicator.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/validators/validation.dart';


class ScnAddressDetails extends StatelessWidget {
  ScnAddressDetails({super.key});

  final phoneNumberController = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController city = TextEditingController();

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
            child: Column(
              children: [
                JGap(
                  h: JSize.spaceBtwSections * 2,
                ),

                 //------------------------------------- PHONE NUMBER ------------------------------------

                TextFormField(
                    decoration: InputDecoration(
                      hintText: JTexts.phoneNo,
                    ),
                    validator: (value) =>
                        JValidator.validateEmptyText(JTexts.name, value)),
                         JGap(),

                //----------------------------------------- ADDRESS ----------------------------------------
                CountryStateCityPicker(
                country: country,
                state: state,
                city: city,
                dialogColor: Color.fromARGB(255, 233, 233, 233),
                textFieldDecoration: InputDecoration(
                  fillColor: JColor.secondary,
                  filled: true,
                  suffixIcon: const Icon(Icons.arrow_downward_rounded),
                  border: const OutlineInputBorder(borderSide: BorderSide.none))
            ),
                JGap(),

                JGap(
                  h: JSize.spaceBtwSections * 3,
                ),

                //---------------------------------------- NEXT BUTTON -------------------------------------

                ElevatedButton(
                    onPressed: () {
                   
                    },
                    child: Text(JTexts.done))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
