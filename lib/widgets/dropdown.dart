import 'package:flutter/material.dart';
import 'package:tcc_app/utils/iterable.dart';

typedef OnChangeDropDown = void Function(int index);
typedef GetItemText<T> = String Function(T value);

class DropDown<T> extends StatelessWidget {
  final List<T> items;
  final OnChangeDropDown onChangeDropDown;
  final GetItemText getItemText;
  final int selectedIndex;

  const DropDown({
    required this.getItemText,
    required this.onChangeDropDown,
    required this.items,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      iconEnabledColor: Colors.black,
      dropdownColor: Colors.white,
      underline: const SizedBox(
        height: 0.0,
      ),
      value: selectedIndex >= 0 ? selectedIndex : null,
      style: const TextStyle(color: Colors.black),
      items: items
          .mapIndexed(
            (e, index) => DropdownMenuItem<int>(
              child: Text(
                getItemText(e),
              ),
              value: index,
            ),
          )
          .toList(),
      onChanged: (value) {
        onChangeDropDown(value!);
      },
    );
  }
}
