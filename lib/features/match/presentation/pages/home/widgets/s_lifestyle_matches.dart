import 'package:flutter/material.dart';
import 'package:ishq/features/match/presentation/widgets/user_card/s_user_vertical_card.dart';
import 'package:ishq/features/match/presentation/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecLifestyleMatches extends StatelessWidget {
  const SecLifestyleMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JSectionLabel(
          heading:JTexts.LIFESTYLE_MATCHES ,
          action: JTexts.SEE_MORE,
          onTap: () {},
        ),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return UserVerticalCard(
                name: 'Fathima',
                age: '22',
                matchValue: 60,
              );
            },
          ),
        ),
      ],
    );
  }
}