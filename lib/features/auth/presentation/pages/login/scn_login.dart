// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/gap.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/validators/validation.dart';

class ScnLogin extends StatelessWidget {
  ScnLogin({super.key});

  final formKey = GlobalKey<FormState>();
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
                      formKey.currentState!.validate();
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