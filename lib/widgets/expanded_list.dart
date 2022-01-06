import 'package:flutter/material.dart';

typedef ExpandedLabelTitle = Widget Function(bool expanded);
typedef RenderList = Widget Function(bool expanded);

class ExpandedList extends StatefulWidget {
  bool expanded;
  ExpandedLabelTitle labelTitle;
  RenderList render;

  ExpandedList({
    required this.labelTitle,
    required this.render,
    this.expanded = true,
    Key? key,
  }) : super(key: key);

  @override
  _ExpandedListState createState() => _ExpandedListState();
}

class _ExpandedListState extends State<ExpandedList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            widget.labelTitle(widget.expanded),
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.expanded = !widget.expanded;
                  });
                },
                color: Colors.black,
                icon: Icon(
                  widget.expanded ? Icons.expand_less : Icons.expand_more,
                ),
              ),
            )
          ],
        ),
        widget.render(widget.expanded),
      ],
    );
  }
}
