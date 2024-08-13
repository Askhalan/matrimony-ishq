

import 'package:flutter/material.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:multi_dropdown/multi_dropdown.dart';


class MaritalStatusEdit extends StatelessWidget {
   MaritalStatusEdit({
    super.key,
    required MultiSelectController<String>  controller,
  }) : _controller = controller;
 final userPref = CurrentUserPreferences();
  final List<String> items = ['Never Maried', 'Maried', 'Divorced', 'Widowed'];
  final MultiSelectController<String> _controller;

  @override
  Widget build(BuildContext context) {
    // creating a list of valueItem widget from the values.
    List<DropdownItem<String>> valueItems = items
        .map((item) => DropdownItem(label: item, value: item)) 
        .toList();
    return MultiDropdown<String>(
      items: valueItems,
      controller: _controller,
      
     
    );
  }
}


// onOptionSelected: (List<DropdownItem> selectedOptions) {},
//  hint: 'Marital Status',
//  options:valueItems,
//       selectionType: SelectionType.multi,
//       chipConfig: const ChipConfig(wrapType: WrapType.wrap),
//       dropdownHeight: 300,
//       // selectedOptionBackgroundColor: JColor.secondary,
//       optionTextStyle: const TextStyle(fontSize: 16),
//       selectedOptionIcon: const Icon(Icons.check_circle),