import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class DobPicker extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime?) onDateSelected;

  const DobPicker({super.key, this.selectedDate, required this.onDateSelected});

  @override
  _DobPickerState createState() => _DobPickerState();
}

class _DobPickerState extends State<DobPicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
  }

  void _showDatePicker(BuildContext context) {
    BottomPicker.date(
      buttonSingleColor: JColor.primary,
      pickerTitle: Text(
        'Set your Birthday',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: JColor.primary,
        ),
      ),
      // dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: selectedDate ?? DateTime(1996, 10, 22),
      maxDateTime: DateTime(2006),
      minDateTime: DateTime(1970),
      pickerTextStyle: Theme.of(context).textTheme.bodyLarge!,
      onSubmit: (index) {
        setState(() {
          selectedDate = index;
        });
        widget.onDateSelected(index);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _showDatePicker(context),
          child: Container(
            padding: JSize.dropdownPading,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: JColor.secondary,
              borderRadius: BorderRadius.circular(JSize.borderRadLg),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedDate != null
                      ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
                      : "Date of birth",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}