import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef OnRefresh = void Function();

class RefreshListView extends StatelessWidget {
  final Widget? header;
  final double? bottomOffset;
  final Widget child;
  final RefreshController refreshController;
  final OnRefresh onRefresh;

  const RefreshListView({
    required this.header,
    required this.bottomOffset,
    required this.child,
    required this.refreshController,
    required this.onRefresh,
    Key? key,
  }) : super(key: key);

  Widget childList(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    if (bottomOffset != null) {
      height = height - bottomOffset!;
    }
    return SizedBox(
      height: height,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      enablePullUp: false,
      physics: const ScrollPhysics(),
      header: const WaterDropHeader(),
      onRefresh: onRefresh,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 0.0),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          header != null
              ? header!
              : const SizedBox(
                  height: 20.0,
                ),
          childList(context),
        ],
      ),
    );
  }
}
