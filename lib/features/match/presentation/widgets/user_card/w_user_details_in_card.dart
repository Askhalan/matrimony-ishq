import 'package:flutter/material.dart';
import 'package:ishq/features/match/presentation/widgets/user_card/w_match_rate_chip.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class UserDetailsInCard extends StatelessWidget {
  const UserDetailsInCard({
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
      padding: JSize.userCardInPad,
      decoration: BoxDecoration(gradient: JColor.blackGradient),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                //------------- Name
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: JColor.white,
                      ),
                ),
              ),
              //----------------- Match Value
              JMatchRateChip(
                value: matchValue,
              )
            ],
          ),
          //----------------- Age
          Text(
            '$age years',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: JColor.white,
                ),
          ),
        ],
      ),
    );
  }
}