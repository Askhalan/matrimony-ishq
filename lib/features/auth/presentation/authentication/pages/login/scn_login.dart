

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/login/w_new_account.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/login/w_login_form.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ScnLogin extends StatelessWidget {
  const ScnLogin({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        body: SingleChildScrollView(
          child: Padding(
            padding: JSize.defaultPadding,
            child: Column(
              children: [
                JGap(h: JSize.spaceBtwSections*8), // Need to add Illustration
                LoginForm(),
                NeedAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

