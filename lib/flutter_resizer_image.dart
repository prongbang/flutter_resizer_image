import 'package:flutter_resizer_image/flutter_resizer_image.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

export 'resizer_image.d.dart';
export 'resizer_image.g.dart';

final _dylib = loadLibForFlutter('libresizer.so');

final ResizerImage _resizerImage = ResizerImageImpl(_dylib);

abstract class FlutterResizerImage {
  FlutterResizerImage();

  factory FlutterResizerImage.instance() =>
      FlutterResizerImageImpl(_resizerImage);

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
  final ResizerImage resizerImage;

  FlutterResizerImageImpl(this.resizerImage);

  @override
  Future<Uint8List> resizer({
    required String image,
    required int width,
    required int height,
  }) =>
      resizerImage.resizer(
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
      resizerImage.resizer(
        image: image,
        width: 0,
        height: 0,
        percent: percent,
      );
}
