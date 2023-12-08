import 'package:flutter/material.dart';

class AppDropdownSelect extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final Function(String selected) onChanged;
  final TextEditingController? controller;

  const AppDropdownSelect(
      {super.key,
      required this.items,
      required this.selectedItem,
      required this.onChanged,
      this.controller});

  @override
  AppDropdownSelectState createState() => AppDropdownSelectState();
}

class AppDropdownSelectState extends State<AppDropdownSelect> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
    if (widget.controller != null) {
      widget.controller!.text = widget.selectedItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        padding: const EdgeInsets.only(left: 12),
        isExpanded: true,
        underline: const SizedBox.shrink(),
        style: Theme.of(context).textTheme.bodyLarge,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue ?? selectedValue;
          });
          if (newValue != null) {
            widget.onChanged(newValue);
          }
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
