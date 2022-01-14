List<T> flattenDeep<T>(Iterable<dynamic> list) => [
      for (var element in list)
        if (element is! Iterable) element else ...flattenDeep(element),
    ];
