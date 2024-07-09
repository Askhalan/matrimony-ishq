// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/appbar.dart';
import 'package:ishq/core/common/widgets/gap.dart';
import 'package:ishq/core/common/widgets/snackbar/error_snackbar.dart';
import 'package:ishq/core/common/widgets/snackbar/show_snackbar.dart';
import 'package:ishq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ishq/features/auth/presentation/pages/temp.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/validators/validation.dart';

class ScnSignup extends StatelessWidget {
  ScnSignup({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
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
               showSnackBar(context,  ErrorSnackBar(message: state.message));
              }
            },
            builder: (context, state) {
              if(state is AuthLoading){
                return Center(child: CircularProgressIndicator());
              }
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: nameController,
                        validator: (value) =>
                            JValidator.validateEmptyText("Name", value),
                        decoration: InputDecoration(
                            hintText: "Name", prefixIcon: Icon(Iconsax.user))),
                    JGap(h: JSize.spaceBtwInputFields),
                    TextFormField(
                        controller: mailController,
                        validator: (value) => JValidator.validateEmail(value),
                        decoration: InputDecoration(
                            hintText: "Email", prefixIcon: Icon(Iconsax.sms))),
                    JGap(h: JSize.spaceBtwInputFields),
                    TextFormField(
                        controller: passwordController,
                        validator: (value) =>
                            JValidator.validatePassword(value),
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Iconsax.lock),
                            suffix: Icon(Iconsax.eye_slash)),
                        obscureText: true),
                    JGap(h: JSize.spaceBtwSections),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthSignup(
                                  name: nameController.text,
                                  password: passwordController.text,
                                  mail: mailController.text.trim(),
                                ));
                          }
                        },
                        child: Text("Login")),
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Temp()),
                          );
                          log("State is success and ${state.uid}");
                        }
                      },
                      child: Container(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
