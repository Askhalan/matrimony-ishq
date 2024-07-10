import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/gap.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(JTexts.processing),
            JGap(),
            SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: JColor.white,
                  strokeWidth: 2,
                )),
          ],
        ));
  }
}