import 'package:flutter/material.dart';

class LabelDescriptionCardProps {
  String label;
  String? labelSufix;
  Widget description;
  Widget? secondLine;
  Widget? mainWidgetRow;
  double topPadding;
  double bottomPadding;
  double rightPadding;
  double leftPadding;

  LabelDescriptionCardProps({
    required this.label,
    required this.description,
    this.secondLine,
    this.labelSufix,
    this.mainWidgetRow,
    this.bottomPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.topPadding = 0,
  });
}

class LabelDescriptionCard extends StatelessWidget {
  final LabelDescriptionCardProps value;

  const LabelDescriptionCard({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(
          left: value.leftPadding,
          right: value.rightPadding,
          top: value.topPadding,
          bottom: value.bottomPadding,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                value.mainWidgetRow != null
                    ? value.mainWidgetRow!
                    : Container(),
              ],
            ),
            value.secondLine ?? Container(),
          ],
        ),
      ),
    );
  }
}
