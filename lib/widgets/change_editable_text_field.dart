import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/text_field.dart';

class ChangeEditableTextField extends StatelessWidget {
  String label;
  bool editable;
  TextEditingController controller;
  ChangeEditableTextField({
    required this.label,
    required this.editable,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldImplementation(
      readOnly: !editable,
      controller: editable
          ? controller
          : TextEditingController(text: label + ": " + controller.text),
      label: label,
      textAlign: TextAlign.left,
      fillColor: Colors.grey,
    );
  }
}
