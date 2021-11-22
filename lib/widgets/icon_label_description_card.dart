import 'package:flutter/material.dart';
import 'package:tcc_app/utils/base64_image.dart';

class IconLabelDescriptionCardProps {
  String base64Image;
  String label;
  Widget description;
  Widget? secondLine;

  IconLabelDescriptionCardProps(
      {required this.base64Image,
      required this.label,
      required this.description,
      this.secondLine});
}

class IconLabelDescriptionCard extends StatelessWidget {
  final IconLabelDescriptionCardProps value;

  const IconLabelDescriptionCard({required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dim = MediaQuery.of(context).size.width * 0.1;
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: dim,
                height: dim,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: imageFromBase64String(value.base64Image).image,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value.label),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.5),
                    child: value.description,
                  ),
                ],
              )
            ],
          ),
          value.secondLine ?? Container(),
        ],
      ),
    );
  }
}
