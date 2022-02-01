import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/text_field.dart';

typedef OnChange = void Function();

// ignore: must_be_immutable
class ChangeEditableTextField extends StatelessWidget {
  String label;
  bool editable;
  TextEditingController controller;
  OnChange? onChange;
  String? errorMessage;
  ChangeEditableTextField({
    required this.label,
    required this.editable,
    required this.controller,
    this.onChange,
    this.errorMessage,
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
      onChange: onChange,
      errorMessage: errorMessage,
    );
  }
}
