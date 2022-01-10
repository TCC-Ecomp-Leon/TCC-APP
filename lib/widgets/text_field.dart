import 'package:flutter/material.dart';

typedef OnVisibleChanged = void Function();
typedef OnChange = void Function();

class TextFieldImplementation extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final double? height;
  final TextInputType textInputType;
  final bool useHidden;
  final OnVisibleChanged? onVisibleChanged;
  final OnChange? onChange;
  String? errorMessage;
  bool isHidden;
  final double? width;

  TextFieldImplementation({
    required this.controller,
    required this.label,
    this.height,
    this.width,
    this.textInputType = TextInputType.text,
    this.useHidden = false,
    this.isHidden = false,
    this.onVisibleChanged,
    this.onChange,
    this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldImplementation> createState() =>
      _TextFieldImplementationState();
}

class _TextFieldImplementationState extends State<TextFieldImplementation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double? height = widget.height;
    if (widget.width != null) {
      width = widget.width!;
    }
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            TextFormField(
              obscureText: widget.isHidden,
              keyboardType: widget.textInputType,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15.0),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: const OutlineInputBorder(),
                hintText: widget.label,
                errorText: (widget.errorMessage != null &&
                        widget.errorMessage!.isNotEmpty)
                    ? widget.errorMessage
                    : null,
              ),
              controller: widget.controller,
              onChanged: (value) {
                if (widget.onChange != null) {
                  widget.onChange!();
                }
              },
            ),
            widget.useHidden
                ? Container(
                    height: height ?? 60.0,
                    padding: const EdgeInsets.only(right: 10.0, bottom: 2.0),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        if (widget.onVisibleChanged != null) {
                          widget.onVisibleChanged!();
                        }
                      },
                      child: Icon(
                        widget.isHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
