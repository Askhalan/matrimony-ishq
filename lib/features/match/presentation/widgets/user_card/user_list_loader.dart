import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/loader/shimmer.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class UserListLoader extends StatelessWidget {
  const UserListLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: JSize.defaultPaddingValue),
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 10),
            padding: JSize.userCardInPad * 0.8,
            height: 100,
            decoration: BoxDecoration(
                color: JColor.softGrey,
                borderRadius: BorderRadius.circular(JSize.borderRadLg)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    JShimmerEffect(width: 80, height: 80),
                    JGap10(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JShimmerEffect(width: 120, height: 15, radius: 5),
                        JGap10(),
                        JShimmerEffect(width: 70, height: 15, radius: 5),
                        JGap10(),
                        JShimmerEffect(width: 70, height: 15, radius: 5),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
