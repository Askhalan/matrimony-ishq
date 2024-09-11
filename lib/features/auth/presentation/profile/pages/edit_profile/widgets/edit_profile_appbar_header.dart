import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/widgets/images/cached_network_image.dart';
import 'package:ishq/core/common/widgets/profile_details_labe.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class EditProfileAppbarHeader extends StatelessWidget {
  EditProfileAppbarHeader({
    super.key,
  });
  final user = CurrentUser();
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
                  child: Stack(
                    children: [
                      JNetworImage(
                        image: user.profileImage!,
                        isNetworkImage: true,
                        height: 190,
                        width: 155,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: EditButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.editProfileImgScn);
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          JGap(),
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 190,
                  decoration: BoxDecoration(
                      border: Border.all(color: JColor.light),
                      borderRadius: BorderRadius.circular(JSize.borderRadLg)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //----------------- Name ----------------
                      Text(
                        user.name!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: JColor.white),
                      ),
                      JGap(h: 10),

                      //----------------- Gender ---------------
                      ProfileDetailsLabel(
                          text: user.gender!,
                          icon: user.gender! == 'Male'
                              ? Iconsax.man
                              : Iconsax.woman),
                      JGap(h: 5),
                      //----------------- Age -----------------
                      ProfileDetailsLabel(
                          text: "${user.dob} ${JTexts.years}", icon: Iconsax.calendar),
                      JGap(h: 5),

                      //----------------- Place ---------------
                      ProfileDetailsLabel(
                          text: user.state!, icon: Iconsax.location),
                      JGap(h: 5),

                      //----------------- Marital Status ------
                      ProfileDetailsLabel(
                          text: user.maritalStatus!, icon: Iconsax.link),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: EditButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.editBasicDetailsScn);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(170, 255, 255, 255),
            borderRadius: BorderRadius.circular(JSize.borderRadMd)),
        child: IconButton(onPressed: onPressed, icon: Icon(Iconsax.edit)));
  }
}
