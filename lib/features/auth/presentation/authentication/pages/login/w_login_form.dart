import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/common/widgets/loader/button_loader.dart';
import 'package:ishq/core/common/widgets/snackbar/error_snackbar.dart';
import 'package:ishq/core/common/widgets/snackbar/show_snackbar.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/authentication/bloc/auth_bloc.dart';

import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, ErrorSnackBar(message: state.message));
        }
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, Routes.navigationMenu);
        }
      },
      builder: (context, state) {
        if (state is LoginSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamed(context, Routes.navigationMenu);
          });
        }

        //------------------------------- LOGIN FORM -------------------------------
        return Form(
          key: formKey,
          child: Column(
            children: [
              //---------------------------- EMAIL ----------------------------

              TextFormField(
                  controller: mailController,
                  validator: (value) => JValidator.validateEmail(value),
                  decoration: const InputDecoration(
                      hintText: JTexts.email, prefixIcon: Icon(Iconsax.sms))),
              const JGap(h: JSize.spaceBtwInputFields),

              //---------------------------- PASSWORD ----------------------------

              TextFormField(
                  controller: passwordController,
                  validator: (value) => JValidator.validateEmptyText(JTexts.password, value),
                  decoration: const InputDecoration(
                      hintText: JTexts.password,
                      prefixIcon: Icon(Iconsax.lock)),
                  obscureText: true),
              const JGap(
                h: JSize.spaceBtwSections,
              ),

              //---------------------------- BUTTON ----------------------------

              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return ButtonLoader();
                  }
                  return ElevatedButton(
                      onLongPress: () {
                        passwordController.text = "Test@1";
                        mailController.text = "test1@gmail.com";
                      },
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthLogin(
                                password: passwordController.text.trim(),
                                mail: mailController.text.trim(),
                              ));
                        }
                      },
                      child: const Text(JTexts.login));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
