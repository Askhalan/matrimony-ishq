// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/containers/w_section_wraper_container.dart';
import 'package:ishq/core/common/widgets/images/cached_network_image.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SMoreUserPhotos extends StatelessWidget {
  const SMoreUserPhotos({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return SectionWraperContainer(
        headerNeeded: true,
        heading: JTexts.MorePhotos,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: JNetworImage(
                    image: user.profileImage,
                    isNetworkImage: true,
                    height: 220,
                    width: 168,
                  )),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: JNetworImage(
                            image: user.profileImage,
                            isNetworkImage: true,
                            width: 100,
                          )),
                      JGap10(),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: JNetworImage(
                            image: user.profileImage,
                            isNetworkImage: true,
                            width: 100,
                          )),
                    ],
                  ),
                  JGap10(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: JNetworImage(
                            image: user.profileImage,
                            isNetworkImage: true,
                            width: 100,
                          )),
                      JGap10(),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: JNetworImage(
                            image: user.profileImage,
                            isNetworkImage: true,
                            width: 100,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          )
        ]);
  }
}
