import 'package:flutter/material.dart';
import 'package:tcc_app/utils/base64_image.dart';

class CardOverlapImage extends StatelessWidget {
  final String base64image;
  final Widget child;
  const CardOverlapImage({
    required this.base64image,
    required this.child,
    Key? key,
  }) : super(key: key);

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
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.white,
          backgroundImage: imageFromBase64String(base64image).image,
        ),
      ],
    );
  }
}
