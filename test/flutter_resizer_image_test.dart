import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_resizer_image/flutter_resizer_image.dart';
import 'package:flutter_resizer_image/flutter_resizer_image_platform_interface.dart';
import 'package:flutter_resizer_image/flutter_resizer_image_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterResizerImagePlatform
    with MockPlatformInterfaceMixin
    implements FlutterResizerImagePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterResizerImagePlatform initialPlatform = FlutterResizerImagePlatform.instance;

  test('$MethodChannelFlutterResizerImage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterResizerImage>());
  });

  test('getPlatformVersion', () async {
    FlutterResizerImage flutterResizerImagePlugin = FlutterResizerImage();
    MockFlutterResizerImagePlatform fakePlatform = MockFlutterResizerImagePlatform();
    FlutterResizerImagePlatform.instance = fakePlatform;

    expect(await flutterResizerImagePlugin.getPlatformVersion(), '42');
  });
}
