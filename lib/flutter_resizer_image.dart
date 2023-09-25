import 'package:flutter_resizer_image/flutter_resizer_image.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

export 'resizer_image.d.dart';
export 'resizer_image.g.dart';

final dylib = loadLibForFlutter('libresizer.so');

final ResizerImage _resizerImage = ResizerImageImpl(dylib);

class FlutterResizerImage {
  static ResizerImage instance = _resizerImage;
}
