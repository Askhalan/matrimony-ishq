import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ProfileAppbarFooter extends StatelessWidget {
  const ProfileAppbarFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          //------------------------- EDIT PROFILE -------------------------

          Flexible(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(JColor.white)),
              child: Text(
                "Edit Profile",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          JGap(),

          //-------------------------- UPGRADE PLAN --------------------------

          Flexible(
            flex: 3,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: JColor.goldGradient,
                    borderRadius: BorderRadius.circular(JSize.borderRadLg)),
                child: Center(
                  child: Text(
                    "Upgrade plan",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          ),
          JGap(),

          //------------------------------ SHARE ------------------------------

          Flexible(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(JColor.white)),
              child: Text(
                "Share",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          )
        ],
      ),
    );
  }
}