import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc_app/utils/base64_image.dart';
import 'package:tcc_app/widgets/full_screen_image.dart';

typedef OnFocusTextField = void Function();
typedef OnSelectImage = void Function(String image);

// ignore: must_be_immutable
class InputCardImageText extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? textEditingController;
  final bool visibleInputSelector;
  String? inputValue;
  OnSelectImage? onSelectImage;
  bool enabled;
  OnFocusTextField? onFocusTextField;

  InputCardImageText({
    required String? input,
    required this.textEditingController,
    this.labelText = "Resposta:",
    this.hintText = "Insira sua resposta para a questão",
    this.visibleInputSelector = true,
    this.onSelectImage,
    this.enabled = true,
    this.onFocusTextField,
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
    if (!widget.enabled) return;
    this.image = null;
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      this.image = File(image.path);
      if (widget.onSelectImage != null) {
        widget.onSelectImage!(imageToBase64String(this.image!));
      }
    }
    setState(() {});
  }

  imgFromGallery() async {
    if (!widget.enabled) return;
    this.image = null;
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (image != null) {
      this.image = File(image.path);
      if (widget.onSelectImage != null) {
        widget.onSelectImage!(imageToBase64String(this.image!));
      }
    }
    setState(() {});
  }

  Widget buildIcon(SelectedInputMethod type) {
    return IconButton(
      color: type == widget.selectedInputMethod ? Colors.black : Colors.grey,
      onPressed: () {
        if (type == SelectedInputMethod.camera) {
          imgFromCamera();
        } else if (type == SelectedInputMethod.gallery) {
          imgFromGallery();
        }
        setState(() {
          widget.selectedInputMethod = type;
        });
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
        height: widget.visibleInputSelector ? 190.0 : null,
        padding: EdgeInsets.only(
          left: 5.0,
          right: 5.0,
          top: 5.0,
          bottom: !widget.visibleInputSelector ? 5.0 : 0.0,
        ),
        child: widget.selectedInputMethod == SelectedInputMethod.text
            ? TextField(
                onTap: widget.onFocusTextField,
                readOnly:
                    widget.textEditingController == null || !widget.enabled,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  hintText: widget.hintText,
                  border: const OutlineInputBorder(
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
      padding: const EdgeInsets.only(
        top: 5.0,
        right: 5.0,
        bottom: 5.0,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          inputCard(context),
          widget.visibleInputSelector ? cardSelector(context) : Container(),
        ],
      ),
    );
  }
}

enum SelectedInputMethod { text, gallery, camera }
