// //
// import 'package:flutter/material.dart';
// import 'package:ishq/utils/constants/sizes.dart';
// import 'package:multi_dropdown/multi_dropdown.dart';

// class JobPrefEdit extends StatelessWidget {
//   JobPrefEdit({
//     super.key,
//     required MultiSelectController<String> controller,
//   }) : _controller = controller;

//   final List<String> items = [
//     'Doctor',
//     'Civil Service',
//     'Engineer',
//     'Designer'
//   ];
//   final MultiSelectController<String> _controller;


//   @override
//   Widget build(BuildContext context) {
//     // creating a list of valueItem widget from the values.
//     List<DropdownItem<String>> valueItems =
//         items.map((item) => DropdownItem(label: item, value: item)).toList();
//     return MultiDropdown<String>(
//       enabled: true,
//       controller: _controller,
//       items: valueItems,
//       chipDecoration: ChipDecoration(
//           wrap: true,
//           runSpacing: 2,
//           spacing: 10,
//           borderRadius: BorderRadius.circular(JSize.borderRadSm)),
//     );
//   }
// }

//  hint: 'Occupation',
//       controller: _controller,
//       onOptionSelected: (List<DropdownItem> selectedOptions) {},
//       options:valueItems,
//       selectionType: SelectionType.multi,
//       chipConfig: const ChipConfig(wrapType: WrapType.wrap),
//       dropdownHeight: 300,
//       optionTextStyle: const TextStyle(fontSize: 16),
//       selectedOptionIcon: const Icon(Icons.check_circle),
