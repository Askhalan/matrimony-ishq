import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:ishq/features/match/presentation/match/pages/home/widgets/w_success_story_card.dart';
import 'package:ishq/features/match/presentation/match/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecSuccessStory extends StatelessWidget {
  const SecSuccessStory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JSectionLabel(heading:JTexts.SUCCESS_STORY ),
        SizedBox(
          height: 200,
          child: Swiper(
            itemCount: 10,
            itemHeight: 190,
            itemWidth: double.infinity,
            layout: SwiperLayout.TINDER,
            itemBuilder: (context, index) {
              return SuccessStoryCard().asGlass();
            },
          ),
        ),
      ],
    );
  }
}