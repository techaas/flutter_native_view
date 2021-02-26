import Flutter
import UIKit

public class FlutterNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
        ) -> FlutterPlatformView {
        return FlutterNativeView(frame: frame, 
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

public class FlutterNativeView : NSObject, FlutterPlatformView {
    private var _view: UIView

    init(frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()

        var label = "NO LABEL"
        if let dict = args as? Dictionary<String, Any> {
            label = dict["message"] as? String ?? "NO MESSAGE"
            print (label)
        }

        // iOS views can be created here
        createNativeView(view: _view, message: label)
    }

    public func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView, message: String){
        _view.backgroundColor = UIColor.blue
        let nativeLabel = UILabel()
        nativeLabel.text = "\(message)\n\nNative text from iOS"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.numberOfLines = 0
        nativeLabel.frame = CGRect(x: 0, y: 0, width: 280, height: 300)
        _view.addSubview(nativeLabel)
    }
}
