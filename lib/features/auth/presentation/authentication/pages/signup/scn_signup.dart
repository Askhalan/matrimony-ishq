import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/signup/w_have_account.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/signup/w_signup_form.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ScnSignup extends StatelessWidget {
  const ScnSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: JAppbar(
      body: SingleChildScrollView(
        child: Padding(
          padding: JSize.defaultPadding,
          child: Column(
            children: [
              JGap(h: JSize.spaceBtwSections * 5), // Need to add Illustration
              SignupForm(),
              AlreadyHaveAccount()
            ],
          ),
        ),
      ),
    ));
  }
}
