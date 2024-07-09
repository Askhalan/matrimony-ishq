// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/appbar.dart';
import 'package:ishq/core/common/widgets/gap.dart';
import 'package:ishq/core/common/widgets/snackbar/error_snackbar.dart';
import 'package:ishq/core/common/widgets/snackbar/show_snackbar.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/validators/validation.dart';

class ScnLogin extends StatelessWidget {
  ScnLogin({super.key});

  final formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        body: SingleChildScrollView(
          child: Padding(
            padding: JSize.defaultPadding,
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  showSnackBar(context, ErrorSnackBar(message: state.message));
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is AuthSuccess) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, Routes.temp);
                  });
                }
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      JGap(),
                      TextFormField(
                          controller: mailController,
                          validator: (value) => JValidator.validateEmail(value),
                          decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(Iconsax.sms))),
                      JGap(h: JSize.spaceBtwInputFields),
                      TextFormField(
                          controller: passwordController,
                          validator: (value) =>
                              JValidator.validatePassword(value),
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Iconsax.lock)),
                          obscureText: true),
                      JGap(),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate() || 1 > 0) {
                              context.read<AuthBloc>().add(AuthLogin(
                                    password: passwordController.text.trim(),
                                    mail: mailController.text.trim(),
                                  ));
                            }
                          },
                          child: Text("Login")),
                      JGap(h: JSize.spaceBtwSections),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signupScn);
                          },
                          child: Text(JTexts.signup))
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
