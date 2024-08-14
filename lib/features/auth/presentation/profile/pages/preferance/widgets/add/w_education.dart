

import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class EducationPref extends StatelessWidget {
   EducationPref({
    super.key,
    required MultiSelectController<String> controller,
  }) : _controller = controller;

  final List<String> items = ['B-Tec', 'Degree', 'Diploma', 'It'];
  final MultiSelectController<String> _controller;

  @override
  Widget build(BuildContext context) {
    // creating a list of valueItem widget from the values.
   List<DropdownItem<String>> valueItems =
        items.map((item) => DropdownItem(label: item, value: item)).toList();
    return MultiDropdown<String>(
      items: valueItems,
      controller: _controller,
      chipDecoration: ChipDecoration(
          borderRadius: BorderRadius.circular(JSize.borderRadMd),
          backgroundColor: JColor.secondary),
      fieldDecoration: FieldDecoration(hintText: 'Education'),
      dropdownDecoration: DropdownDecoration(
        elevation: 1,
        maxHeight: 300,
      ),
      dropdownItemDecoration:
          DropdownItemDecoration(selectedTextColor: JColor.success),
    );
  }
}
