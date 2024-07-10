import 'package:flutter/material.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/text_strings.dart';


class NeedAccount extends StatelessWidget {
  const NeedAccount({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(JTexts.needAccount),
        TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.signupScn);
            },
            child: Text(
              JTexts.signup,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: JColor.primary),
            ))
      ],
    );
  }
}
