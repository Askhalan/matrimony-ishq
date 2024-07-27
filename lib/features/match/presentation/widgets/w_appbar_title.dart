import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    super.key,
    required this.title,
    this.subtitle = '',
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: JColor.white),
        ),
        Text(subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: JColor.white)),
      ],
    );
  }
}
