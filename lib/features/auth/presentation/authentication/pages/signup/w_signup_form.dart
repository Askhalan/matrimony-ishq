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

class SignupForm extends StatelessWidget {
  SignupForm({
    super.key,
  });

  final formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, ErrorSnackBar(message: state.message));
        }
        if (state is AuthSuccess) {
          Navigator.pushNamed(context, Routes.basicDetailsScn);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Form(
          key: formKey,
          child: Column(
            children: [
              //------------------------- EMAIL -------------------------

              TextFormField(
                  controller: mailController,
                  validator: (value) => JValidator.validateEmail(value),
                  decoration: InputDecoration(
                      hintText: JTexts.email, prefixIcon: Icon(Iconsax.sms))),
              JGap(h: JSize.spaceBtwInputFields),

              //------------------------- PASSWORD -------------------------

              TextFormField(
                  controller: passwordController,
                  // validator: (value) => JValidator.validatePassword(value),
                  decoration: InputDecoration(
                      hintText: JTexts.password,
                      prefixIcon: Icon(Iconsax.lock),
                      suffix: Icon(Iconsax.eye_slash)),
                  obscureText: true),
              JGap(h: JSize.spaceBtwInputFields),

              //------------------------- CONFIRM-PASSWORD -------------------------

              TextFormField(
                  controller: confirmPasswordController,
                  // validator: (value) => JValidator.validateConfirmPassword(
                  //     passwordController.text, value),
                  decoration: InputDecoration(
                      hintText: JTexts.confirmPassword,
                      prefixIcon: Icon(Iconsax.lock),
                      suffix: Icon(Iconsax.eye_slash)),
                  obscureText: true),
              JGap(h: JSize.spaceBtwSections),

              //------------------------- BUTTON -------------------------

              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return ButtonLoader();
                  }
                  return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthSignup(
                                password: passwordController.text,
                                mail: mailController.text.trim(),
                              ));
                             
                        }
                      },
                      child: Text(JTexts.signup));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}



// v9cSJwXo5HYKGrheXpo5awkR6C33