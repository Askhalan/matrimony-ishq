import 'package:flutter/material.dart';
import 'package:ishq/features/app/data/models/user_model_match.dart';
import 'package:ishq/features/app/presentation/match/widgets/user_card/s_user_vertical_card.dart';
import 'package:ishq/features/app/presentation/match/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecFamilyMatches extends StatelessWidget {
  const SecFamilyMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JSectionLabel(
          heading: JTexts.FAMILY_MATCHES,
          action: 'See more',
          onTap: () {},
        ),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return UserVerticalCard(
                user: UserModelMatch.empty(),
              );
            },
          ),
        ),
      ],
    );
  }
}
