import 'package:flutter/material.dart';
import 'package:ishq/features/match/presentation/widgets/user_card/s_user_vertical_card.dart';
import 'package:ishq/features/match/presentation/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecProfessionalMatches extends StatelessWidget {
  const SecProfessionalMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JSectionLabel(
          heading:JTexts.PROFESSIONAL_MATCHES,
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
                name: 'Farsana',
                age: '20',
                matchValue: 60,
              );
            },
          ),
        ),
      ],
    );
  }
}

