// // ignore_for_file: must_be_immutable

import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:ishq/core/common/widgets/controllers/dropdown_controller.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JDropdown extends StatefulWidget {
  final String selectedItem;
  final List<String> items;
  final String title;
  final ValueChanged<String> onItemSelected;

  const JDropdown({
    super.key,
    required this.selectedItem,
    required this.items,
    required this.title,
    required this.onItemSelected,
  });

  @override
  State<JDropdown> createState() => _DropdownState();
}

class _DropdownState extends State<JDropdown> {
  String? _selectedItem;
  String? _title;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
    _title = widget.title;
  }

  void showDropdown(BuildContext context) {
    BottomPicker(
      buttonSingleColor: JColor.primary,
      items: widget.items.map((name) => Center(child: Text(name))).toList(),
      pickerTitle: Text(
        'Select $_title',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: JColor.primary,
        ),
      ),
      titleAlignment: Alignment.center,
      pickerTextStyle: Theme.of(context).textTheme.bodyLarge!,
      closeIconColor: Colors.red,
      onSubmit: (index) {
        setState(() {
          _selectedItem = widget.items[index];
          widget.onItemSelected(_selectedItem!);
        });
      },
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDropdown(context),
      child: Container(
        padding: JSize.dropdownPading,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: JColor.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedItem != "" ? _selectedItem! : _title!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

