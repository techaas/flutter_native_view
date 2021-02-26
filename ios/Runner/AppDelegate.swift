import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)

    weak var registrar = self.registrar(forPlugin: "embed_native")

    let factory = FlutterNativeViewFactory(messenger: registrar!.messenger())
    self.registrar(forPlugin: "<embed_native>")!.register(
        factory,
        withId: "NativeView")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
