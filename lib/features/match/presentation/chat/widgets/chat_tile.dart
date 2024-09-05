// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/images/cached_network_image.dart';
import 'package:ishq/core/common/widgets/spaces/gap_2.dart';
import 'package:ishq/features/match/domain/entities/chat_entity.dart';
import 'package:ishq/features/match/presentation/chat/pages/scn_chat_ui.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.chat,
    required this.otherUser,
  });
  final Chat chat;
  final UserEntity otherUser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScnChatUi(
                user: otherUser,
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: JSize.defaultPaddingValue),
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
                    child: JNetworImage(
                        width: 70,
                        height: 70,
                        isNetworkImage: true,
                        image: otherUser.profileImage)),
                JGap2(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      otherUser.name,
                      // user.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '${otherUser.dob} Years',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
            // Text(
            //   '',
            //   overflow: TextOverflow.ellipsis,
            //   style: Theme.of(context).textTheme.labelSmall,
            // ),
          ],
        ),
      ),
    );
  }
}
