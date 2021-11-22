import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tcc_app/utils/iterable.dart';

class PageControllerPage {
  Widget child;
  String label;
  PageControllerPage({
    required this.child,
    required this.label,
  });
}

class PageControllerImplementation extends StatefulWidget {
  final String? title;
  final List<PageControllerPage> children;
  final double width;

  const PageControllerImplementation({
    required this.children,
    required this.width,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  _PageControllerImplementationState createState() =>
      _PageControllerImplementationState();
}

class _PageControllerImplementationState
    extends State<PageControllerImplementation> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _navigate(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  _buildMenu() {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: CustomPaint(
        painter: _BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget.children.mapIndexed(
            (e, index) {
              return Container(
                width: 120.0,
                alignment: Alignment.center,
                child: TextButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    _navigate(index);
                  },
                  child: Text(
                    e.label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: index == _selectedIndex
                            ? Colors.black
                            : Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'WorkSansSemiBold'),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
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
            _buildMenu(),
            Expanded(
              flex: 2,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: widget.children.map((e) => e.child).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomTheme {
  const _CustomTheme();

  static const Color loginGradientStart = Color(0xFFADD8E6);
  // static const Color loginGradientEnd = Color(0xFF00BFFF);
  // static const Color loginGradientStartButtom = Color(0xFF40E0D0);
  // static const Color loginGradientStartButtomDark = Color(0xFF1E90FF);
  static const Color white = Color(0xFFFFFFFF);
  // static const Color black = Color(0xFF000000);
  // static const Color buttom = Color(0xFF0000FF);
  // static const Color secundaryStart = Color(0xFF3CB371);
  // static const Color secundaryEnd = Color(0xFF2E8B57);

  // static const LinearGradient primaryGradient = LinearGradient(
  //   colors: <Color>[loginGradientStart, loginGradientEnd],
  //   stops: <double>[0.0, 1.0],
  //   begin: Alignment.topCenter,
  //   end: Alignment.bottomCenter,
  // );
}

class _BubbleIndicatorPainter extends CustomPainter {
  _BubbleIndicatorPainter(
      {this.dxTarget = 100.0,
      this.dxEntry = 25.0,
      this.radius = 21.0,
      this.dy = 25.0,
      required this.pageController})
      : super(repaint: pageController) {
    painter = Paint()
      ..color = _CustomTheme.white
      ..style = PaintingStyle.fill;
  }

  Paint? painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  final PageController pageController;

  @override
  void paint(Canvas canvas, Size size) {
    final ScrollPosition pos = pageController.position;
    final double fullExtent =
        pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension;

    final double pageOffset = pos.extentBefore / fullExtent;

    final bool left2right = dxEntry < dxTarget;
    final Offset entry = Offset(left2right ? dxEntry : dxTarget, dy);
    final Offset target = Offset(left2right ? dxTarget : dxEntry, dy);

    final Path path = Path();
    path.addArc(
        Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(
        Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawShadow(path, _CustomTheme.loginGradientStart, 3.0, true);
    canvas.drawPath(path, painter!);
  }

  @override
  bool shouldRepaint(_BubbleIndicatorPainter oldDelegate) => true;
}
