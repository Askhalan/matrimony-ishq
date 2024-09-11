import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class JLottieAnimation extends StatelessWidget {
  const JLottieAnimation(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
      const JGap(
        h: JSize.defaultSpace,
      ),
      Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
      const JGap(
        h: JSize.defaultSpace,
      ),
      showAction
          ? SizedBox(
              width: 250,
              child: OutlinedButton(
                  onPressed: onActionPressed,
                  child: Text(
                    actionText!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: JColor.light),
                  )),
            )
          : const SizedBox()
    ]);
  }
}
