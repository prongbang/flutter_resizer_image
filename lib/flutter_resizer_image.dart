
import 'flutter_resizer_image_platform_interface.dart';

class FlutterResizerImage {
  Future<String?> getPlatformVersion() {
    return FlutterResizerImagePlatform.instance.getPlatformVersion();
  }
}
