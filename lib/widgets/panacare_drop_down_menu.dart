import 'package:flutter/material.dart';

class PanacareDropDownMenu extends StatelessWidget {
  Color? color;
  List<DropdownMenuItem> menuItems;
  String hint;
  Function? onChanged;

  PanacareDropDownMenu(
      {super.key,
      required this.menuItems,
      this.onChanged,
      required this.hint,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: color ?? const Color.fromRGBO(41, 170, 225, 1),
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton(
            dropdownColor: color ?? const Color.fromRGBO(41, 170, 225, 1),
            onChanged: (value) => onChanged ?? {},
            iconEnabledColor: Colors.white,
            underline: const SizedBox(),
            isExpanded: true,
            hint: Text(
              hint,
              style: const TextStyle(color: Colors.white),
            ),
            items: menuItems
                .map((menuItem) => DropdownMenuItem(
                      value: menuItem.value,
                      child: menuItem.child,
                    ))
                .toList()));
  }
}
