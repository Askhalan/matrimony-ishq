// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/images/user_images.dart';
import 'package:ishq/core/common/widgets/spaces/gap_2.dart';
import 'package:ishq/utils/constants/image_strings.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
       
        margin: EdgeInsets.only(top: 10),
        padding:
            EdgeInsets.symmetric(horizontal: JSize.defaultPaddingValue),
        decoration: BoxDecoration(
            // color: JColor.softGrey,
            borderRadius: BorderRadius.circular(JSize.borderRadLg)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(
                    child: JImageView(
                  isNetworkImage: false,
                  src: JImages.user2,
                  height: 70,
                  width: 70,
                )),
                JGap2(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UserName',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      'Years',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
            Text(
              '10:03 ',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
