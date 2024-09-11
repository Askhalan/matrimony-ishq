import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// ignore: must_be_immutable
class HeightRangeSelector extends StatefulWidget {
  HeightRangeSelector({super.key, required this.heightRange});
  SfRangeValues heightRange;
  @override
  State<HeightRangeSelector> createState() => _HeightRangeSelectorState();
}

class _HeightRangeSelectorState extends State<HeightRangeSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: JColor.secondary,
              borderRadius: BorderRadius.circular(JSize.borderRadMd)),
          child: Text(
              '${JTexts.Height}: ${widget.heightRange.start.toString().substring(0, 3)} - ${widget.heightRange.end.toString().substring(0, 3)}'),
        ),
        Flexible(
          child: SfRangeSlider(
            min: 4,
            max: 7,
            values: widget.heightRange,
            stepSize: 0.5,
            showTicks: true,
            enableTooltip: true,
            onChanged: (SfRangeValues values) {
              setState(() {
                widget.heightRange = values;
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
