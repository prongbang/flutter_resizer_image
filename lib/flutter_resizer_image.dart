import 'package:flutter_resizer_image/flutter_resizer_image.d.dart';
import 'package:flutter_resizer_image/flutter_resizer_image.g.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

final dylib = loadLibForFlutter('libresizer.so');

final FlutterResizerImage resizerImage = FlutterResizerImageImpl(dylib);
