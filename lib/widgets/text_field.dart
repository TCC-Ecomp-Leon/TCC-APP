import 'package:flutter/material.dart';

class TextFieldImplementation extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final double height;
  final TextInputType textInputType;
  final bool useHidden;
  final double? width;

  const TextFieldImplementation(
      {required this.controller,
      required this.label,
      this.height = 60.0,
      this.width,
      this.textInputType = TextInputType.text,
      this.useHidden = false,
      Key? key})
      : super(key: key);

  @override
  State<TextFieldImplementation> createState() =>
      _TextFieldImplementationState();
}

class _TextFieldImplementationState extends State<TextFieldImplementation> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = widget.height;
    if (widget.width != null) {
      width = widget.width!;
    }
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            TextFormField(
              obscureText: _isHidden,
              keyboardType: widget.textInputType,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15.0),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: const OutlineInputBorder(),
                hintText: widget.label,
              ),
              controller: widget.controller,
            ),
            widget.useHidden
                ? Container(
                    height: height,
                    padding: const EdgeInsets.only(right: 10.0, bottom: 2.0),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
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
