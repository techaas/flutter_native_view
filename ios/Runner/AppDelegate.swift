import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let viewFactory = FlutterNativeViewFactory()
    registrar(forPlugin: "Embed")?.register(viewFactory, withId: "NativeView")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

public class FlutterNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
        ) -> FlutterPlatformView {
        return FlutterNativeView(frame, viewId: viewId, args: args)
    }
}

public class FlutterNativeView : NSObject, FlutterPlatformView {
    let frame: CGRect
    let viewId: Int64

    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
    }

    public func view() -> UIView {
        return UISlider(frame: frame)
    }
}
