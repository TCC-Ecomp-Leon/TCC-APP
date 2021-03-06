import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CarouselIndicator extends StatefulWidget {
  final List<Widget> children;
  const CarouselIndicator({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  _CarouselIndicatorState createState() => _CarouselIndicatorState();
}

class _CarouselIndicatorState extends State<CarouselIndicator> {
  // final int _current = 0;
  // final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (context, index) {
          return widget.children[index];
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        itemCount: widget.children.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(color: Colors.white),
      ),
    );
    // return Column(
    //   children: [
    //     Expanded(
    //       child: CarouselSlider(
    //         items: widget.children,
    //         carouselController: _controller,
    //         options: CarouselOptions(
    //           autoPlay: false,
    //           enlargeCenterPage: false,
    //           aspectRatio: 1.0,
    //           onPageChanged: (index, reason) {
    //             setState(
    //               () {
    //                 _current = index;
    //               },
    //             );
    //           },
    //         ),
    //       ),
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: widget.children.asMap().entries.map(
    //         (entry) {
    //           return GestureDetector(
    //             onTap: () => _controller.animateToPage(entry.key),
    //             child: Container(
    //               width: 12.0,
    //               height: 12.0,
    //               margin: const EdgeInsets.symmetric(
    //                   vertical: 8.0, horizontal: 4.0),
    //               decoration: BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: (Theme.of(context).brightness == Brightness.dark
    //                         ? Colors.white
    //                         : Colors.black)
    //                     .withOpacity(_current == entry.key ? 0.9 : 0.4),
    //               ),
    //             ),
    //           );
    //         },
    //       ).toList(),
    //     ),
    //   ],
    // );
  }
}
