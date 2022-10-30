import 'package:flutter/material.dart';
import 'package:web_insets/interface.dart' as _interface;

_interface.WebInsets get insets => WebInsets();

class WebInsets implements _interface.WebInsets {
  @override
  void initializeViewPort() {}
  @override
  num get devicePixelRatio {
    return 1;
  }

  @override
  bool get isInStandaloneMode => false;
  @override
  String? get referrer => null;
  @override
  double get left => 0;
  @override
  double get right => 0;
  @override
  double get top => 0;
  @override
  double get bottom => 0;
}

_interface.WebInsetsListener listener(_interface.WebIsetsListenerCallback callback) =>
    WebInsetsListener(callback);

class WebInsetsListener implements _interface.WebInsetsListener {
  WebInsetsListener(this.callback);

  final _interface.WebIsetsListenerCallback callback;

  @override
  EdgeInsets get value => const EdgeInsets.all(0);

  @override
  void dispose() {}
}
