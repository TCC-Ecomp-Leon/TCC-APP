import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCardImageText extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String? input;
  const InputCardImageText({
    required this.input,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  State<InputCardImageText> createState() => _InputCardImageTextState();
}

class _InputCardImageTextState extends State<InputCardImageText> {
  _SelectedInputMethod selectedInputMethod = _SelectedInputMethod.text;

  Widget cardSelector(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  selectedInputMethod = _SelectedInputMethod.text;
                });
              },
              icon: const Icon(Icons.keyboard),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedInputMethod = _SelectedInputMethod.gallery;
                });
              },
              icon: const Icon(Icons.collections),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedInputMethod = _SelectedInputMethod.camera;
                });
              },
              icon: const Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputCard(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 400.0,
        padding: const EdgeInsets.only(
            left: 5.0, right: 5.0, top: 5.0, bottom: 10.0),
        child: selectedInputMethod == _SelectedInputMethod.text
            ? TextField(
                readOnly: widget.textEditingController == null,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Resposta:',
                  hintText: "Insira sua resposta para a questão",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                maxLines: 10,
                controller: widget.textEditingController ??
                    TextEditingController(text: widget.input),
              )
            : Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: inputCard(context),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: cardSelector(context),
          ),
        ],
      ),
    );
  }
}

enum _SelectedInputMethod { text, gallery, camera }
