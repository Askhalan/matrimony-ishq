import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class JFormDivider extends StatelessWidget {
  const JFormDivider({
    super.key,
    required this.dark, required this.dividerText,
  });

  final bool dark;
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Divider(
          color: dark ? JColor.darkGrey : JColor.grey,
          thickness: 0.5,
          indent: 0,
          endIndent: 10,
        )),
        Text(dividerText),
        Flexible(
            child: Divider(
          color: dark ? JColor.darkGrey : JColor.grey,
          thickness: 0.5,
          indent: 10,
          endIndent: 0,
        ))
      ],
    );
  }
}