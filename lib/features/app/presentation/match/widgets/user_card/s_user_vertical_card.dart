import 'package:flutter/material.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/images/cached_network_image.dart';
import 'package:ishq/features/app/presentation/match/pages/user%20detailed%20info/scn_user_detail_page.dart';
import 'package:ishq/features/app/presentation/match/widgets/user_card/w_user_details_in_card.dart';
import 'package:ishq/utils/constants/enums.dart';
import 'package:ishq/utils/constants/sizes.dart';

class UserVerticalCard extends StatelessWidget {
  const UserVerticalCard({
    super.key,
    required this.user,
  });
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScnUserDetails(
                user: user,
                footerStatus: FooterStatus.send,
              ),
            ));
      },
      child: Container(
        width: JSize.vUserCardWidth,
        margin: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(JSize.borderRadLg),
            child: Stack(
              children: [
                JNetworImage(
                  image: user.profileImage,
                  isNetworkImage: true,
                  height: JSize.vUserCardHeight,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: UserDetailsInCard(
                    name: user.name,
                    age: user.dob,
                    matchValue: 10,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
