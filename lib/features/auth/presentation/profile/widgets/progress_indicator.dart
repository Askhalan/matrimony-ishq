import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class SignupProgressIndicator extends StatelessWidget {
  const SignupProgressIndicator({super.key, this.step});

final step;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: 10,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(JSize.borderRadMd),color: JColor.softGrey),
          ),
        ),
         Flexible(
           child: Container(
            margin: EdgeInsets.only(left: 5),
            height: 10,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(JSize.borderRadMd),color: step >2 ?JColor.softGrey : JColor.disabledGrey),
                     ),
         ),
         Flexible(
           child: Container(
            margin: EdgeInsets.only(left: 5),
            height: 10,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(JSize.borderRadMd),color: step >3 ?JColor.softGrey : JColor.disabledGrey),
                     ),
         ),
         
      ],
    );
  }
}