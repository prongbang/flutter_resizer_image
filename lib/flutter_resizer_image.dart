import 'dart:typed_data';

import 'package:resizer/resizer.dart' as r;

abstract class FlutterResizerImage {
  FlutterResizerImage();

  factory FlutterResizerImage.instance() => FlutterResizerImageImpl();

  static Future<void> init() {
    return r.init();
  }

  Future<Uint8List> resizer({
    required String image,
    required int width,
    required int height,
  });

  Future<Uint8List> resizerWithPercent({
    required String image,
    required int percent,
  });
}

class FlutterResizerImageImpl implements FlutterResizerImage {
  FlutterResizerImageImpl();

  @override
  Future<Uint8List> resizer({
    required String image,
    required int width,
    required int height,
  }) =>
      r.resizer(
        image: image,
        width: width,
        height: height,
        percent: 0,
      );

  @override
  Future<Uint8List> resizerWithPercent({
    required String image,
    required int percent,
  }) =>
      r.resizer(
        image: image,
        width: 0,
        height: 0,
        percent: percent,
      );
}
