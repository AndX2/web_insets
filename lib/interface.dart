import 'package:flutter/material.dart';

import '/src/export.dart'
    if (dart.library.io) '/src/implementation_io.dart'
    if (dart.library.html) '/src/implementation_web.dart';

abstract class WebInsets {
  factory WebInsets() {
    return insets;
  }
  void initializeViewPort() => throw UnsupportedError('No implementation');

  num get devicePixelRatio => throw UnsupportedError('No implementation');

  bool get isInStandaloneMode => throw UnsupportedError('No implementation');

  String? get referrer => throw UnsupportedError('No implementation');

  double get left => throw UnsupportedError('No implementation');

  double get right => throw UnsupportedError('No implementation');

  double get top => throw UnsupportedError('No implementation');

  double get bottom => throw UnsupportedError('No implementation');
}

typedef WebIsetsListenerCallback = void Function(EdgeInsets insets);

abstract class WebInsetsListener {
  factory WebInsetsListener(WebIsetsListenerCallback callback) {
    return listener(callback);
  }

  EdgeInsets get value => throw UnsupportedError('No implementation');

  void dispose() => throw UnsupportedError('No implementation');
}
