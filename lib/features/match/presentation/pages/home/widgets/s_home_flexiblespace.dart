import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class HomeFlexibleSpace extends StatelessWidget {
  const HomeFlexibleSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.addPreferenceScn);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Complete your profile",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: JColor.white)),
            JGap(
              h: 5,
            ),
            LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(JColor.secondary),
                value: 3 / 6,
                minHeight: 40,
                borderRadius: BorderRadius.circular(JSize.borderRadLg))
          ],
        ),
      ),
    );
  }
}
