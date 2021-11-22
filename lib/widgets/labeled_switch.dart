import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

typedef SwitchFunction = void Function(int index);

class LabeledSwitch extends StatelessWidget {
  final List<String> labels;
  final int initialLabelIndex;
  final SwitchFunction switchFunction;

  const LabeledSwitch(
      {required this.labels,
      required this.switchFunction,
      this.initialLabelIndex = 0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      initialLabelIndex: initialLabelIndex,
      totalSwitches: labels.length,
      labels: labels,
      onToggle: switchFunction,
    );
  }
}
