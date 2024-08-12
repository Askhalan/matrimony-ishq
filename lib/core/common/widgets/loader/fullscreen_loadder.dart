import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/loader/lottie_animation.dart';

class JFullscreenLoader extends StatelessWidget {
  const JFullscreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return JLottieAnimation(text: 'We are processing your information', animation: 'assets/animations/Animation - 1722833414565.json');
  }
}


