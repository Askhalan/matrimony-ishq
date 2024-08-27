import 'package:flutter/material.dart';
import 'package:ishq/features/match/presentation/match/widgets/w_appbar_title.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class HomeAppbarTitle extends StatelessWidget {
  const HomeAppbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppbarTitle(
      title: JTexts.homeappBarTitle,
      subtitle: JTexts.homeappBarSubtitle,
    );
  }
}
