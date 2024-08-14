import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// ignore: must_be_immutable
class HeightRangeSelectorEdit extends StatefulWidget {
  HeightRangeSelectorEdit({
    super.key,
    required this.heightRange,
    required this.onRangeChanged, // Callback to notify changes
  });
  SfRangeValues heightRange;
  final void Function(SfRangeValues) onRangeChanged; 

  @override
  State<HeightRangeSelectorEdit> createState() => _HeightRangeSelectorState();
}

class _HeightRangeSelectorState extends State<HeightRangeSelectorEdit> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: JColor.secondary,
            borderRadius: BorderRadius.circular(JSize.borderRadMd),
          ),
          child: Text(
            'Height: ${widget.heightRange.start.toStringAsFixed(1)} - ${widget.heightRange.end.toStringAsFixed(1)}',
          ),
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
                widget.onRangeChanged(values);
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
