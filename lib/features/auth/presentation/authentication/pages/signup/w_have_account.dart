import 'package:flutter/material.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/text_strings.dart';


class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(JTexts.haveAccount),
        TextButton(
            onPressed: () {
             Navigator.pushReplacementNamed(context, Routes.loginScn);
            },
            child: Text(
              JTexts.loginNow,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: JColor.primary),
            ))
      ],
    );
  }
}
