import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class GenderChip extends StatefulWidget {
  final String selectedGender;
  final ValueChanged<String> onItemSelected;

  const GenderChip({
    super.key,
    required this.selectedGender,
    required this.onItemSelected,
  });

  @override
  GenderChipState createState() => GenderChipState();
}

class GenderChipState extends State<GenderChip> {
  late String _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.selectedGender;
  }

  void _onGenderSelected(String gender) {
    setState(() {
      _selectedGender = gender;
    });
    widget.onItemSelected(gender); // Trigger the callback to update the parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () => _onGenderSelected('Male'),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: _selectedGender == 'Male' ? JColor.primary : JColor.secondary,
                borderRadius: BorderRadius.circular(JSize.borderRadLg),
              ),
              child: Center(
                child: Text(
                  JTexts.Male,
                  style: TextStyle(
                    color: _selectedGender == 'Male' ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        JGap(),
        Flexible(
          child: GestureDetector(
            onTap: () => _onGenderSelected('Female'),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: _selectedGender == 'Female' ? JColor.primary : JColor.secondary,
                borderRadius: BorderRadius.circular(JSize.borderRadLg),
              ),
              child: Center(
                child: Text(
                  JTexts.female,
                  style: TextStyle(
                    color: _selectedGender == 'Female' ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}