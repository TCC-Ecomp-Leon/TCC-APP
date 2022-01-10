import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

typedef SwitchFunction = void Function(int index);

class LabeledSwitch extends StatelessWidget {
  final List<String> labels;
  int index;
  final SwitchFunction switchFunction;
  final double minWidth;
  int actualIndex = 0;

  LabeledSwitch({
    required this.labels,
    required this.switchFunction,
    this.index = 0,
    this.minWidth = 72.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      initialLabelIndex: index,
      totalSwitches: labels.length,
      labels: labels,
      onToggle: switchFunction,
      minWidth: minWidth,
    );
  }
}
