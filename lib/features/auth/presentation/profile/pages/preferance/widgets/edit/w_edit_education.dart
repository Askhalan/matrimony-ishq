

// import 'package:flutter/material.dart';
// import 'package:multi_dropdown/multi_dropdown.dart';


// class EducationPrefEdit extends StatelessWidget {
//    EducationPrefEdit({
//     super.key,
//     required MultiSelectController controller,
//   }) : _controller = controller;

//   final List<String> items = ['B-Tec', 'Degree', 'Diploma', 'It'];
//   final MultiSelectController _controller;

//   @override
//   Widget build(BuildContext context) {
//     // creating a list of valueItem widget from the values.
//     List<ValueItem> valueItems = items
//         .map((item) => ValueItem(label: item, value: item)) 
//         .toList();
//     return MultiSelectDropDown(
      
//       // searchEnabled: true,
//       hint: 'Education',
//       controller: _controller,
//       onOptionSelected: (List<ValueItem> selectedOptions) {
//       },
//       options:valueItems,
//       selectionType: SelectionType.multi,
//       chipConfig: const ChipConfig(wrapType: WrapType.wrap),
//       dropdownHeight: 300,
//       optionTextStyle: const TextStyle(fontSize: 16),
//       selectedOptionIcon: const Icon(Icons.check_circle),
    
//     );
//   }
// }
