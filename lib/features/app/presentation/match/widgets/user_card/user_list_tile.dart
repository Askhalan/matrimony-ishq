
import 'package:flutter/material.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/images/cached_network_image.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/features/app/presentation/match/pages/user%20detailed%20info/scn_user_detail_page.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/enums.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
    required this.footerStatus,
  });

  final UserEntity user;
  final FooterStatus footerStatus;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScnUserDetails(
              user: user,
              footerStatus: footerStatus,
            ),
          )),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: JSize.userCardInPad * 0.8,
        height: 100,
        decoration: BoxDecoration(
            color: JColor.softGrey,
            borderRadius: BorderRadius.circular(JSize.borderRadLg)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                JNetworImage(
                  isNetworkImage: true,
                  image: user.profileImage,
                  height: 80,
                  width: 80,
                ),
                JGap10(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '${user.dob} ${JTexts.years}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      user.state,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 207, 224),
                  borderRadius: BorderRadius.circular(JSize.borderRadLg)),
              child: Text(
               JTexts.cancelRequest,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
