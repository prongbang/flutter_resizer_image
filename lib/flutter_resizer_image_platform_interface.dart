import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_resizer_image_method_channel.dart';

abstract class FlutterResizerImagePlatform extends PlatformInterface {
  /// Constructs a FlutterResizerImagePlatform.
  FlutterResizerImagePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterResizerImagePlatform _instance = MethodChannelFlutterResizerImage();

  /// The default instance of [FlutterResizerImagePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterResizerImage].
  static FlutterResizerImagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterResizerImagePlatform] when
  /// they register themselves.
  static set instance(FlutterResizerImagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
