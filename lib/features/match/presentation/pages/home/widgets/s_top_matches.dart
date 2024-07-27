import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:ishq/features/match/presentation/widgets/w_card_horizondal.dart';
import 'package:ishq/features/match/presentation/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/image_strings.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecTopMatches extends StatelessWidget {
  const SecTopMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        //-------------------------------- Section Label --------------------------------
        JSectionLabel(
          heading: JTexts.TOP_MATCHES,
          action: JTexts.SEE_MORE,
          onTap: () {},
        ),

        //-------------------------------- Carousel --------------------------------
        SizedBox(
          height: 180,
          child: Swiper(
            itemCount: 10,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (context, index) {
              return WUserCardHorizondal(
                image: JImages.defaultUser,
                age: "27 years",
                cast: "Sunni",
                name: 'Fidha Fathima',
                state: "Koilandi",
              );
            },
          ),
        ),
      ],
    );
  }
}
