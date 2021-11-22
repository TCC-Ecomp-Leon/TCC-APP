import 'package:flutter/material.dart';

typedef GetRenderElement<T> = Widget Function(T obj, int index);

class GenericListView<T> extends StatelessWidget {
  final List<T> itens;
  final GetRenderElement render;

  final ScrollController _scrollController = ScrollController();

  GenericListView({required this.itens, required this.render, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
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
