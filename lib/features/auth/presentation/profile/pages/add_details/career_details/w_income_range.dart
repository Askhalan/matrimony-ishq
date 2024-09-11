import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// ignore: must_be_immutable
class IncomeRange extends StatefulWidget {
  IncomeRange({super.key, required this.incomeRange});
  SfRangeValues incomeRange;
  @override
  State<IncomeRange> createState() => _IncomeRangeState();
}

class _IncomeRangeState extends State<IncomeRange> {
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
              '${JTexts.age}: ${widget.incomeRange.start.toString().substring(0, 2)} - ${widget.incomeRange.end.toString().substring(0, 2)}'),
        ),
        Flexible(
          child: SfRangeSlider(
            min: 1,
            max: 100,
            values: widget.incomeRange,
            stepSize: 2.0,
            showTicks: true,
            enableTooltip: true,
            onChanged: (SfRangeValues values) {
              setState(() {
                widget.incomeRange = values;
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
