// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/gap.dart';
import 'package:ishq/features/auth/presentation/bloc/auth_bloc.dart';
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
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: JSize.defaultPadding,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                ),
                TextFormField(
                    controller: nameController,
                    validator: (value) =>
                        JValidator.validateEmptyText("Name", value),
                    decoration: InputDecoration(
                        hintText: "Name", prefixIcon: Icon(Iconsax.sms))),
                JGap(h: JSize.spaceBtwInputFields),
                TextFormField(
                    controller: mailController,
                    validator: (value) => JValidator.validateEmail(value),
                    decoration: InputDecoration(
                        hintText: "Email", prefixIcon: Icon(Iconsax.sms))),
                JGap(h: JSize.spaceBtwInputFields),
                TextFormField(
                    controller: passwordController,
                    validator: (value) => JValidator.validatePassword(value),
                    decoration: InputDecoration(
                        hintText: "Password", prefixIcon: Icon(Iconsax.lock)),
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
                    child: Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
