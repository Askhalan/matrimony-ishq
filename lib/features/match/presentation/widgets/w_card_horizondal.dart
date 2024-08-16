// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/images/cached_network_image.dart';
import 'package:ishq/core/common/widgets/profile_details_labe.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/features/match/presentation/pages/user%20detailed%20info/scn_user_detail_page.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/helpers/helper_functions.dart';

class WUserCardHorizondal extends StatelessWidget {
  const WUserCardHorizondal({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final bool isDark = JHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScnUserDetails(user: user),
            ));
      },
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              boxShadow: [JColor.boxSHadow],
              color: isDark ? JColor.dark : JColor.white,
              borderRadius: BorderRadius.circular(JSize.borderRadXl)),
          child: Row(
            children: [
              //------------------ User Image ---------------------
              AspectRatio(
                aspectRatio: 4 / 5,
                child: Container(
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 72, 213, 235),
                      borderRadius: BorderRadius.circular(JSize.borderRadXl)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      //----------------- Profile Image --------
                      child: JNetworImage(
                        image: user.profileImage,
                        isNetworkImage: true,
                        height: 150,
                        width: 155,
                      )),
                ),
              ),
              JGap(
                w: 10,
              ),

              //--------------------- User Details -------------------

              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //------------Name------------
                    Text(
                      user.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                    ),
                    JGap(
                      h: 10,
                    ),

                    //------------Age------------

                    ProfileDetailsLabel(text: user.dob, icon: Iconsax.calendar,isThemeNeede: true,),
                    JGap(h: 5),

                    //------------Location------------

                    ProfileDetailsLabel(
                        text: user.state, icon: Iconsax.location,isThemeNeede: true,),
                    JGap(h: 5),

                    //------------Location------------
                    ProfileDetailsLabel(
                        text: user.maritalStatus, icon: Iconsax.link,isThemeNeede: true,),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
