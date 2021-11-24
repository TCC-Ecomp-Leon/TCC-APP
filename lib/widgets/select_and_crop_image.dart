import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tcc_app/utils/base64_image.dart';

typedef SelectImage = void Function(String base64);

class SelectAndCropImage extends StatelessWidget {
  final String cropTitle;
  final String fromGalleryMessage;
  final String fromCameraMessage;
  final double opacity;
  final SelectImage changeImage;
  final List<CropAspectRatioPreset> ratioAspects;
  final bool lockAspectRatio;

  const SelectAndCropImage({
    required this.cropTitle,
    required this.fromGalleryMessage,
    required this.fromCameraMessage,
    required this.opacity,
    required this.changeImage,
    this.lockAspectRatio = true,
    this.ratioAspects = const [CropAspectRatioPreset.square],
    Key? key,
  }) : super(key: key);

  cropImage(File imageFile, BuildContext context) async {
    File? croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: ratioAspects,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: cropTitle,
        toolbarColor: Colors.deepOrange,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: ratioAspects.isEmpty
            ? ratioAspects[0]
            : CropAspectRatioPreset.original,
        lockAspectRatio: lockAspectRatio,
      ),
      iosUiSettings: IOSUiSettings(
        title: cropTitle,
        minimumAspectRatio: 1.0,
        aspectRatioLockEnabled: true,
      ),
    );
    if (croppedFile != null) {
      changeImage(imageToBase64String(croppedFile));
    }
  }

  imgFromCamera(BuildContext context) async {
    XFile? _image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    if (_image != null) {
      cropImage(File(_image.path), context);
    }
  }

  imgFromGallery(BuildContext context) async {
    XFile? _image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (_image != null) {
      cropImage(File(_image.path), context);
    }
  }

  void showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: SizedBox(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.photo_library,
                  ),
                  title: Text(
                    fromGalleryMessage,
                  ),
                  onTap: () {
                    imgFromGallery(context);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.photo_camera,
                  ),
                  title: Text(
                    fromCameraMessage,
                  ),
                  onTap: () {
                    imgFromCamera(context);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: IconButton(
        onPressed: () {
          showPicker(context);
        },
        icon: const Icon(
          Icons.image,
        ),
        iconSize: 20.0,
      ),
    );
  }
}
