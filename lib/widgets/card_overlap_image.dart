import 'package:flutter/material.dart';
import 'package:tcc_app/utils/base64_image.dart';
import 'package:tcc_app/widgets/select_and_crop_image.dart';

class CardOverlapImage extends StatelessWidget {
  final String base64image;
  final Widget child;
  final SelectImage? changeImage;
  const CardOverlapImage({
    required this.base64image,
    required this.child,
    required this.changeImage,
    Key? key,
  }) : super(key: key);

  Widget buildImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: changeImage != null ? 0.9 : 1.0,
          child: CircleAvatar(
            radius: 40.0,
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
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 5.0,
                right: 5.0,
                bottom: 5.0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  child,
                ],
              ),
            ),
          ),
        ),
        buildImage(),
      ],
    );
  }
}
