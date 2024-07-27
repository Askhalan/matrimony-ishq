import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/images/user_images.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/image_strings.dart';
import 'package:ishq/utils/constants/sizes.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.name,
    required this.age,
    required this.place,
  });

  final String name;
  final String age;
  final String place;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: JSize.userCardInPad * 0.8,
      height: 90,
      decoration: BoxDecoration(
          color: JColor.softGrey,
          borderRadius: BorderRadius.circular(JSize.borderRadLg)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              JImageView(
                isNetworkImage: false,
                src: JImages.user3,
                height: 80,
                width: 80,
                radius: JSize.borderRadMd,
              ),
              JGap10(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    '$age Years',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    place,
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
              'Cancel Request',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          )
        ],
      ),
    );
  }
}