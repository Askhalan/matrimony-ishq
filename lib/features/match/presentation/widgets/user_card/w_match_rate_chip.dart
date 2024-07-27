import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JMatchRateChip extends StatelessWidget {
  const JMatchRateChip({
    super.key,
    required this.value,
  });
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 20,
      width: 30,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 163, 246, 175),
          borderRadius: BorderRadius.circular(JSize.borderRadSm)),
      child: Text('$value%'),
    );
  }
}
