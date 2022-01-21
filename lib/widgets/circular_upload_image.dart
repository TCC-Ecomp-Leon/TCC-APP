import 'package:flutter/material.dart';
import 'package:tcc_app/utils/base64_image.dart';
import 'package:tcc_app/widgets/select_and_crop_image.dart';

class CircularUploadImage extends StatelessWidget {
  final double radius;
  final String base64image;
  final SelectImage? changeImage;
  const CircularUploadImage({
    required this.base64image,
    required this.changeImage,
    this.radius = 100.0,
    Key? key,
  }) : super(key: key);

  Widget buildImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: changeImage != null ? 0.9 : 1.0,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.white,
            backgroundImage: imageFromBase64String(base64image).image,
          ),
        ),
        changeImage != null
            ? SelectAndCropImage(
                cropTitle: "Nova foto de perfil",
                fromGalleryMessage: "Galeria",
                fromCameraMessage: "Câmera",
                opacity: 0.2,
                changeImage: changeImage!,
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }
}
