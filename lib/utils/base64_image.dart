import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';

Image imageFromBase64String(String base64String) {
  return Image.memory(
    base64Decode(
      base64String.replaceFirst("data:image/png;base64,", ""),
    ),
  );
}

String imageToBase64String(File image) {
  return "data:image/png;base64," +
      base64Encode(
        image.readAsBytesSync(),
      );
}
