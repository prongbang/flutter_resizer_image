import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_resizer_image/flutter_resizer_image_method_channel.dart';

void main() {
  MethodChannelFlutterResizerImage platform = MethodChannelFlutterResizerImage();
  const MethodChannel channel = MethodChannel('flutter_resizer_image');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
