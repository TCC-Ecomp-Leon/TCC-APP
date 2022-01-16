import 'package:flutter/material.dart';

typedef OnChange = void Function(int index);

class ChildRadioCard extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Widget child;
  final OnChange onChange;
  final Color cardColor;
  final Color cardSelectedColor;
  final int? correctOption;

  get selected => index == selectedIndex;
  get correct => correctOption != null && correctOption == index ? true : false;
  get wrong => correctOption != null
      ? selected
          ? true
          : false
      : false;

  const ChildRadioCard({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.child,
    required this.onChange,
    required this.cardColor,
    required this.cardSelectedColor,
    required this.correctOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: correctOption != null
            ? correct
                ? Colors.green
                : wrong
                    ? Colors.red
                    : Colors.white
            : selected
                ? cardSelectedColor.withOpacity(0.5)
                : cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: RadioListTile(
        value: index,
        groupValue: selectedIndex,
        onChanged: (val) {
          onChange(val as int);
        },
        activeColor: Colors.white,
        controlAffinity: ListTileControlAffinity.trailing,
        title: child,
      ),
    );
  }
}
