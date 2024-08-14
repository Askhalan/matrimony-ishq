import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class MaritalStatusEdit extends StatefulWidget {
  const MaritalStatusEdit({
    super.key,
    required MultiSelectController<String> controller,
  }) : _controller = controller;
  final MultiSelectController<String> _controller;

  @override
  State<MaritalStatusEdit> createState() => _MaritalStatusEditState();
}

class _MaritalStatusEditState extends State<MaritalStatusEdit> {
  final userPref = CurrentUserPreferences();

 final List<String> items = [ 'Never Maried', 'Maried', 'Divorced', 'Widowed'];
  @override
  void initState() {
    _selectPreviouslySelectedItems();
    log(userPref.maritalStatusPref.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // creating a list of valueItem widget from the values.
    List<DropdownItem<String>> valueItems =
        items.map((item) => DropdownItem(label: item, value: item)).toList();
    return MultiDropdown<String>(
      items: valueItems,
      controller: widget._controller,
      chipDecoration: ChipDecoration(
          borderRadius: BorderRadius.circular(JSize.borderRadMd),
          backgroundColor: JColor.secondary),
      fieldDecoration: FieldDecoration(hintText: 'Marital Status'),
      dropdownDecoration: DropdownDecoration(
        elevation: 1,
        maxHeight: 300,
      ),
      dropdownItemDecoration:
          DropdownItemDecoration(selectedTextColor: JColor.success),
    );
  }

void _selectPreviouslySelectedItems() {
  log("Selecting previous items");
  List selectedStatuses = userPref.maritalStatusPref ?? [];
  log("Stored preferences: $selectedStatuses");

  widget._controller.selectWhere((item) {
    bool isSelected = selectedStatuses.any((status) {
      bool match = status.toLowerCase().replaceAll(' ', '') == 
                   item.value.toLowerCase().replaceAll(' ', '');
      log("Comparing: '$status' with '${item.value}', Match: $match");
      return match;
    });
    log("Checking item: ${item.value}, Is selected: $isSelected");
    return isSelected;
  });

  log("Selected items: ${widget._controller.selectedItems.map((item) => item.value).toList()}");
  setState(() {}); // Force rebuild
}

}
