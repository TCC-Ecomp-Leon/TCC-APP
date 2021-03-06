import 'package:flutter/material.dart';

class LateralPageControllerImplementation extends StatefulWidget {
  final PageController pageController;
  final String? title;
  final List<Widget> children;

  const LateralPageControllerImplementation({
    required this.pageController,
    required this.children,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  _LateralPageControllerImplementationState createState() =>
      _LateralPageControllerImplementationState();
}

class _LateralPageControllerImplementationState
    extends State<LateralPageControllerImplementation> {
  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          PageController _controller = widget.pageController;
          if (_controller.page != null &&
              _controller.page!.round() == _controller.initialPage) {
            return true;
          } else {
            _controller.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
            );
            return false;
          }
        },
        child: Column(
          children: [
            widget.title != null
                ? Padding(
                    child: Text(
                      widget.title as String,
                      textScaleFactor: 1.3,
                    ),
                    padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                  )
                : Container(),
            Expanded(
              flex: 2,
              child: PageView(
                controller: widget.pageController,
                children: widget.children,
              ),
            )
          ],
        ),
      ),
    );
  }
}
