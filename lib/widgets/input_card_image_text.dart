import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc_app/utils/base64_image.dart';
import 'package:tcc_app/widgets/full_screen_image.dart';

class InputCardImageText extends StatefulWidget {
  final TextEditingController? textEditingController;
  String? inputValue;

  InputCardImageText({
    required String? input,
    required this.textEditingController,
    Key? key,
  }) : super(key: key) {
    selectedInputMethod = SelectedInputMethod.text;
    if (input != null) {
      if (input.contains("data:image/png;base64")) {
        selectedInputMethod = SelectedInputMethod.gallery;
      } else {
        selectedInputMethod = SelectedInputMethod.text;
      }
      inputValue = input;
    }
  }

  SelectedInputMethod selectedInputMethod = SelectedInputMethod.text;

  @override
  State<InputCardImageText> createState() => _InputCardImageTextState();
}

class _InputCardImageTextState extends State<InputCardImageText> {
  File? image;

  Image? get renderImage {
    if (image != null) {
      return Image.file(
        image!,
        fit: BoxFit.fill,
      );
    } else if (widget.inputValue != null &&
        widget.inputValue!.contains("data:image/png;base64")) {
      return Image(
        image: imageFromBase64String(widget.inputValue!).image,
        fit: BoxFit.fill,
      );
    }
    return null;
  }

  imgFromCamera() async {
    this.image = null;
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      this.image = File(image.path);
    }
    setState(() {});
  }

  imgFromGallery() async {
    this.image = null;
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (image != null) {
      this.image = File(image.path);
    }
    setState(() {});
  }

  Widget buildIcon(SelectedInputMethod type) {
    return IconButton(
      color: type == widget.selectedInputMethod ? Colors.black : Colors.grey,
      onPressed: () {
        if (widget.inputValue == null) {
          if (type == SelectedInputMethod.camera) {
            imgFromCamera();
          } else if (type == SelectedInputMethod.gallery) {
            imgFromGallery();
          }
          setState(() {
            widget.selectedInputMethod = type;
          });
        }
      },
      icon: Icon(
        type == SelectedInputMethod.text
            ? Icons.keyboard
            : type == SelectedInputMethod.gallery
                ? Icons.collections
                : Icons.camera_alt,
      ),
    );
  }

  Widget cardSelector(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildIcon(SelectedInputMethod.text),
          buildIcon(SelectedInputMethod.gallery),
          buildIcon(SelectedInputMethod.camera),
        ],
      ),
    );
  }

  Widget inputCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 200.0,
        padding: const EdgeInsets.only(
          left: 5.0,
          right: 5.0,
          top: 5.0,
        ),
        child: widget.selectedInputMethod == SelectedInputMethod.text
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
                maxLines: 5,
                controller: widget.textEditingController ??
                    TextEditingController(text: widget.inputValue),
              )
            : GestureDetector(
                onTap: () {
                  if (renderImage != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImage(
                          base64: widget.selectedInputMethod !=
                                  SelectedInputMethod.text
                              ? widget.inputValue
                              : null,
                          file: image,
                        ),
                      ),
                    );
                  }
                },
                child: AbsorbPointer(
                  absorbing: renderImage != null,
                  child: SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          child: renderImage,
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: buildIcon(widget.selectedInputMethod),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 5.0, bottom: 5.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          inputCard(context),
          cardSelector(context),
        ],
      ),
    );
  }
}

enum SelectedInputMethod { text, gallery, camera }
