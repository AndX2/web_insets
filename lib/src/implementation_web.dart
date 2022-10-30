@JS()

import 'package:flutter/material.dart';
import 'package:js/js.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:web_insets/interface.dart' as _interface;

typedef _InsetCallbackHandler = void Function(Inset result);

@JS('safeAreaInsets.onChange')
external void onChange(_InsetCallbackHandler callback);
@JS('safeAreaInsets.offChange')
external void offChange(_InsetCallbackHandler callback);
@JS('safeAreaInsets.left')
external num get _left;
@JS('safeAreaInsets.top')
external num get _top;
@JS('safeAreaInsets.right')
external num get _right;
@JS('safeAreaInsets.bottom')
external num get _bottom;

@JS('navigator.standalone')
external bool? get _standAlone;

@JS('document.referrer')
external String? get _referrer;

@JS()
@anonymous
class Inset {
  external num get left;
  external num get top;
  external num get right;
  external num get bottom;
}

_interface.WebInsets get insets => WebInsets();

class WebInsets implements _interface.WebInsets {
  @override
  void initializeViewPort() {
    final viewportMeta = html.MetaElement()
      ..setAttribute('flt-viewport', '')
      ..name = 'viewport'
      ..content =
          'width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover';
    html.document.head!.append(viewportMeta);
  }

  @override
  num get devicePixelRatio {
    return 1;
  }

  @override
  bool get isInStandaloneMode =>
      (html.window.matchMedia('(display-mode: standalone)').matches) ||
      (_standAlone ?? false) ||
      (_referrer ?? '').contains('android-app://');
  @override
  String? get referrer => _referrer;

  @override
  double get left => _left.isNaN ? 0 : _left.toDouble() / devicePixelRatio;
  @override
  double get right => _right.isNaN ? 0 : _right.toDouble() / devicePixelRatio;
  @override
  double get top => _top.isNaN ? 0 : _top.toDouble() / devicePixelRatio;
  @override
  double get bottom => _bottom.isNaN ? 0 : _bottom.toDouble() / devicePixelRatio;
}

_interface.WebInsetsListener listener(_interface.WebIsetsListenerCallback callback) =>
    WebInsetsListener(callback);

class WebInsetsListener implements _interface.WebInsetsListener {
  WebInsetsListener(this.callback) {
    subscription = allowInterop(_onChange);
    onChange(subscription);
    _init();
  }

  final _interface.WebIsetsListenerCallback callback;

  late WebInsets _insets;
  late _InsetCallbackHandler subscription;
  late EdgeInsets _value;

  @override
  EdgeInsets get value => _value;

  @override
  void dispose() {
    offChange(subscription);
  }

  void _init() {
    _insets = WebInsets();
    _value = EdgeInsets.fromLTRB(
      _left.isNaN ? 0 : _left.toDouble() / _insets.devicePixelRatio,
      _top.isNaN ? 0 : _top.toDouble() / _insets.devicePixelRatio,
      _right.isNaN ? 0 : _right.toDouble() / _insets.devicePixelRatio,
      _bottom.isNaN ? 0 : _bottom.toDouble() / _insets.devicePixelRatio,
    );
  }

  void _onChange(Inset result) {
    _value = EdgeInsets.fromLTRB(
      _left.isNaN ? 0 : _left.toDouble() / _insets.devicePixelRatio,
      _top.isNaN ? 0 : _top.toDouble() / _insets.devicePixelRatio,
      _right.isNaN ? 0 : _right.toDouble() / _insets.devicePixelRatio,
      _bottom.isNaN ? 0 : _bottom.toDouble() / _insets.devicePixelRatio,
    );

    callback(value);
  }
}
