import Flutter
import UIKit

public class FlutterResizerImagePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_resizer_image", binaryMessenger: registrar.messenger())
    let instance = FlutterResizerImagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  public func dummyMethodToEnforceBundling() {
      // This will never be executed
      resize_image("", 100, 100);
  }
}
