import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String value;
  final void Function(String?)? onChanged;
  final List<String> items;

  const DropDownWidget({
    required this.value,
    required this.onChanged,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: value,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>(
            (String text) {
              return DropdownMenuItem<String>(
                value: text,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 30,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
