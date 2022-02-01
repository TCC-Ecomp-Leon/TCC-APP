import 'package:flutter/material.dart';

enum LoadingType {
  circular,
  linear,
}

class Loading extends StatefulWidget {
  final int circleTimeSeconds;
  final Color color;
  final LoadingType loadingType;
  const Loading({
    required this.color,
    required this.circleTimeSeconds,
    this.loadingType = LoadingType.circular,
    Key? key,
  }) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.circleTimeSeconds),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loadingType == LoadingType.linear) {
      return LinearProgressIndicator(
        value: controller.value,
        color: widget.color,
      );
    }
    return CircularProgressIndicator(
      value: controller.value,
      color: widget.color,
    );
  }
}
