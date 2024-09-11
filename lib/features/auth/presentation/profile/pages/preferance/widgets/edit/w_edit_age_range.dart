// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AgeRangeEdit extends StatefulWidget {
  AgeRangeEdit({
    super.key,
    required this.ageRange,
    required this.onRangeChanged, // Callback to notify changes
  });
  SfRangeValues ageRange;
  final void Function(SfRangeValues) onRangeChanged; // Callback
  final userPref = CurrentUserPreferences();

  @override
  State<AgeRangeEdit> createState() => _AgeRangeState();
}

class _AgeRangeState extends State<AgeRangeEdit> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 130,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: JColor.secondary,
            borderRadius: BorderRadius.circular(JSize.borderRadMd),
          ),
          child: Text(
            '${JTexts.age}: ${widget.ageRange.start.toString().substring(0, 2)} - ${widget.ageRange.end.toString().substring(0, 2)}',
          ),
        ),
        Flexible(
          child: SfRangeSlider(
            min: 18,
            max: 60,
            values: widget.ageRange,
            stepSize: 1.0,
            showTicks: true,
            enableTooltip: true,
            onChanged: (SfRangeValues values) {
              setState(() {
                widget.ageRange = values;
                widget.onRangeChanged(values); // Notify parent of the change
              });
            },
            activeColor: JColor.secondary,
            thumbShape: SfThumbShape(),
          ),
        ),
      ],
    );
  }
}
