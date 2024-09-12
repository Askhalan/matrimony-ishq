import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JSectionLabel extends StatelessWidget {
  const JSectionLabel({
    super.key,
    required this.heading,
    this.action = '',
    this.onTap,
  });
  final String heading;
  final String action;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: JSize.sessionLabelPad,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              action,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}