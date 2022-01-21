import 'package:flutter/material.dart';

typedef GetRenderElement<T> = Widget Function(T obj, int index);

class GenericListView<T> extends StatelessWidget {
  final List<T> itens;
  final GetRenderElement<T> render;
  final bool shrinkWrap;
  final double paddingRight;
  final double paddingLeft;

  final ScrollController _scrollController = ScrollController();

  GenericListView(
      {required this.itens,
      required this.render,
      this.shrinkWrap = false,
      this.paddingLeft = 20.0,
      this.paddingRight = 20.0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: paddingLeft,
        right: paddingRight,
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            shrinkWrap: shrinkWrap,
            padding: const EdgeInsets.only(top: 0.0),
            controller: _scrollController,
            itemCount: itens.length,
            itemBuilder: (BuildContext context, int index) {
              return render(itens[index], index);
            },
          ),
        ),
      ),
    );
  }
}
