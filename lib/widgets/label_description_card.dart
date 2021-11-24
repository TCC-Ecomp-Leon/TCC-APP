import 'package:flutter/material.dart';
import 'package:tcc_app/utils/base64_image.dart';

class LabelDescriptionCardProps {
  String label;
  String? labelSufix;
  Widget description;
  Widget? secondLine;

  LabelDescriptionCardProps({
    required this.label,
    required this.description,
    this.secondLine,
    this.labelSufix,
  });
}

class LabelDescriptionCard extends StatelessWidget {
  final LabelDescriptionCardProps value;

  const LabelDescriptionCard({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        value.label,
                      ),
                      const SizedBox(
                        width: 150.0,
                      ),
                      value.labelSufix != null
                          ? Text(
                              value.labelSufix!,
                              textScaleFactor: 0.8,
                            )
                          : Container(),
                    ],
                  ),
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