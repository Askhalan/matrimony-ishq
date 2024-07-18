import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/features/Profile/presentation/pages/profile/widgets/w_profile_details_label.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ProfileAppbarHeader extends StatelessWidget {
  const ProfileAppbarHeader({
    super.key,
  });

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
              width: 155,
              height: 190,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), 
    
                //----------------- Profile Image --------
                  child: Image.asset(
                    "assets/images/defaultUserImages.jpeg",
                    fit: BoxFit.cover,
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
                  "Askhalan",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: JColor.white),
                ),
                JGap(h: 10),
    
                //----------------- Age -----------------
                ProfileDetailsLabel(text: "23 years",icon: Iconsax.calendar),
                JGap(h: 5),
    
                //----------------- Place ---------------
                ProfileDetailsLabel(text: "Kozhicode",icon: Iconsax.location),
                JGap(h: 5),
    
                //----------------- Caste ---------------
                ProfileDetailsLabel(text: "Sunni",icon: Iconsax.moon),
                JGap(h: 5),
    
                //----------------- Marital Status ------
                ProfileDetailsLabel(text: "Not Maried",icon: Iconsax.link),
              ],
            ),
          )
        ],
      ),
    );
  }
}