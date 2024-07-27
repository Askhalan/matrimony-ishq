import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/images/user_images.dart';
import 'package:ishq/features/match/presentation/widgets/user_card/w_user_details_in_card.dart';
import 'package:ishq/utils/constants/image_strings.dart';
import 'package:ishq/utils/constants/sizes.dart';

class UserVerticalCard extends StatelessWidget {
  const UserVerticalCard({
    super.key,
    required this.name,
    required this.age,
    required this.matchValue,
  });

  final String name;
  final String age;
  final int matchValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(JSize.borderRadLg),
          child: Stack(
            children: [
              JImageView(
                isNetworkImage: false,
                src: JImages.user1,
                height: 270,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: UserDetailsInCard(
                  name: name,
                  age: age,
                  matchValue: matchValue,
                ),
              ),
            ],
          )),
    );
  }
}
