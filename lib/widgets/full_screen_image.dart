import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tcc_app/utils/base64_image.dart';

class FullScreenImage extends StatelessWidget {
  final String? base64;
  final File? file;
  const FullScreenImage({required this.base64, required this.file, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: base64 != null
            ? Image(
                image: imageFromBase64String(base64!).image,
                fit: BoxFit.fill,
              )
            : file != null
                ? Image.file(
                    file!,
                    fit: BoxFit.fill,
                  )
                : Container(),
      ),
    );
  }
}
