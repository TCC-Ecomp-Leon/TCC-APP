import 'package:flutter/material.dart';

typedef OnClickEdit = void Function();

class CardOverlapTitle extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final AlignmentGeometry stackAlignment;
  IconData? icon;
  OnClickEdit? onClickEdit;

  CardOverlapTitle({
    required this.title,
    required this.children,
    this.stackAlignment = Alignment.topLeft,
    this.icon,
    this.onClickEdit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: stackAlignment,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Card(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 13.0,
                    bottom: 5.0,
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                ),
                icon != null
                    ? IconButton(
                        onPressed: onClickEdit,
                        icon: Icon(icon),
                        color: Colors.black,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textScaleFactor: 1.2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
