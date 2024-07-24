import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ProfileSuiteDetails extends StatelessWidget {
  const ProfileSuiteDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: JSize.defaultPadding,
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [JColor.boxSHadow],
          gradient: JColor.premiumProfilegGradient,
          borderRadius: BorderRadius.circular(JSize.borderRadLg)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //------------------- LOGO ------------------
              Container(
                color: JColor.primary,
                height: 50,
                width: 50,
              ),
               Container(
                color: JColor.secondary,
                height: 50,
                width: 50,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //------------------- LOGO ------------------
              Text(
                "Askhalan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: JColor.white, fontSize: 24),
              ),
               Text(
                "Id: 234285",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: JColor.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //------------------- LOGO ------------------
              Text(
                "Premium Suite",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: JColor.white,),
              ),
               Text(
                "Valid: 06/25",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: JColor.white),
              )
            ],
          )
        ],
      ),
    );
  }
}