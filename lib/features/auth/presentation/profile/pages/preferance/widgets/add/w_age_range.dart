import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// ignore: must_be_immutable
class AgeRange extends StatefulWidget {
  AgeRange({super.key, required this.ageRange});
  SfRangeValues ageRange;
  @override
  State<AgeRange> createState() => _AgeRangeState();
}

class _AgeRangeState extends State<AgeRange> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 130,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: JColor.secondary,
              borderRadius: BorderRadius.circular(JSize.borderRadMd)),
          child: Text(
              '${JTexts.age}: ${widget.ageRange.start.toString().substring(0, 2)} - ${widget.ageRange.end.toString().substring(0, 2)}'),
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
