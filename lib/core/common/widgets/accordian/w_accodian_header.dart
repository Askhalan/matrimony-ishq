import 'package:flutter/material.dart';

class JAccordianHeader extends StatelessWidget {
  const JAccordianHeader({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}