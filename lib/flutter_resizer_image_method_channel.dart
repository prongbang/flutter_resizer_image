import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_resizer_image_platform_interface.dart';

/// An implementation of [FlutterResizerImagePlatform] that uses method channels.
class MethodChannelFlutterResizerImage extends FlutterResizerImagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_resizer_image');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
