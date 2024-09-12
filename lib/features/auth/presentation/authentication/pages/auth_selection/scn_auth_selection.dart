// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/utils/constants/image_strings.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class ScnAuthSelection extends StatelessWidget {
  const ScnAuthSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 79, 6, 24),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: JSize.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //------------------------------------ LOGO ------------------------------------

                SizedBox(
                  height: 190,
                  width: 300,
                  child: Image.asset(
                    JImages.logoTextTag,
                    fit: BoxFit.cover,
                  ),
                ),

                //--------------------------------- GOOGLE AUTH -------------------------------

                

                //-----------------------------------APPLE AUTH -------------------------------

              

                //------------------------------------- LOGIN -----------------------------------

                JGap(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.loginScn);
                    },
                    child: Text(JTexts.login)),

                //-------------------------------------- SIGNUP ----------------------------------

                JGap(),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.signupScn);
                    },
                    child: Text(JTexts.signup,
                        style: Theme.of(context).textTheme.bodyLarge))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
