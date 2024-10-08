import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/images/cached_network_image.dart';
import 'package:ishq/core/common/widgets/profile_details_labe.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class UserDetailsAppbarHeader extends StatelessWidget {
  const UserDetailsAppbarHeader({
    super.key, required this.user,
  });
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: JSize.defaultPaddingValue,
          right: JSize.defaultPaddingValue,
          top: JSize.defaultPaddingValue * 4),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  //----------------- Profile Image --------
                  child: JNetworImage(
                    image: user.profileImage,
                    isNetworkImage: true,
                    height: 190,
                    width: 155,
                  )),
            ),
          ),
          JGap(),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----------------- Name ----------------
                Text(
                  user.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: JColor.white),
                ),
                JGap(h: 10),

                //----------------- Gender ---------------
                ProfileDetailsLabel(
                    text: user.gender,
                    icon: user.gender == 'Male' ? Iconsax.man : Iconsax.woman),
                JGap(h: 5),
                //----------------- Age -----------------
                ProfileDetailsLabel(
                    text: "${user.dob} ${JTexts.years}", icon: Iconsax.calendar),
                JGap(h: 5),

                //----------------- Place ---------------
                ProfileDetailsLabel(text: user.state, icon: Iconsax.location),
                JGap(h: 5),

                //----------------- Marital Status ------
                ProfileDetailsLabel(
                    text: user.maritalStatus, icon: Iconsax.link),
              ],
            ),
          )
        ],
      ),
    );
  }
}
