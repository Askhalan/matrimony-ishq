

// import 'package:flutter/material.dart';
// import 'package:ishq/core/common/sessions/current_user_prefs.dart';


// class MaritalStatusEdit extends StatelessWidget {
//    MaritalStatusEdit({
//     super.key,
//     required MultiSelectController controller,
//   }) : _controller = controller;
//  final userPref = CurrentUserPreferences();
//   final List<String> items = ['Never Maried', 'Maried', 'Divorced', 'Widowed'];
//   final MultiSelectController _controller;

//   @override
//   Widget build(BuildContext context) {
//     // creating a list of valueItem widget from the values.
//     List<ValueItem> valueItems = items
//         .map((item) => ValueItem(label: item, value: item)) 
//         .toList();
//     return MultiSelectDropDown(
//       hint: 'Marital Status',
//       controller: _controller,
//       onOptionSelected: (List<ValueItem> selectedOptions) {},
//       options:valueItems,
//       selectionType: SelectionType.multi,
//       chipConfig: const ChipConfig(wrapType: WrapType.wrap),
//       dropdownHeight: 300,
//       // selectedOptionBackgroundColor: JColor.secondary,
//       optionTextStyle: const TextStyle(fontSize: 16),
//       selectedOptionIcon: const Icon(Icons.check_circle),
//     );
//   }
// }
