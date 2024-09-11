import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/images/user_images.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/image_strings.dart';
import 'package:ishq/utils/constants/sizes.dart';

class SuccessStoryCard extends StatelessWidget {
  const SuccessStoryCard({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: JSize.userCardInPad,
      decoration: BoxDecoration(
        border: Border.all(color: JColor.softGrey),
          color: Color.fromARGB(67, 253, 200, 226),
          borderRadius:
              BorderRadius.circular(JSize.borderRadLg)),
      child: Row(
        children: [
          JImageView(
            isNetworkImage: false,
            src: JImages.defaultUser,
            width: 150,
            radius: JSize.borderRadLg,
          ),
          JGap10(),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'May the years ahead be filled with love and joy',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall,
                ),
                Text(
                  'Shameer Ali & Haseena',
                  style:
                      Theme.of(context).textTheme.bodySmall,
                ),
                JGap10(),
                Text(
                  'hiibhjkhbuuubjiuh khiug iujkn ugi',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
    
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
