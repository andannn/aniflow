import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    static let channelName = "com.andannn.animetracker/auth"
	private var eventSink: FlutterEventSink?

	override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
	    GeneratedPluginRegistrant.register(with: self)
        guard let controller: FlutterViewController = window?.rootViewController as? FlutterViewController else {
			return super.application(application, didFinishLaunchingWithOptions: launchOptions)
		}
		let eventChannel = FlutterEventChannel(name: AppDelegate.channelName, binaryMessenger: controller.binaryMessenger)
        eventChannel.setStreamHandler(self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

extension AppDelegate: FlutterStreamHandler {

	override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		if url.scheme == "animetracker" {
			eventSink?(url.absoluteString.replacingOccurrences(of: "#", with: "?"))
			eventSink?(FlutterEndOfEventStream)
			eventSink = nil
			return true
	    }

		return false
	}

	func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
		eventSink = events
		return nil
	}

	func onCancel(withArguments arguments: Any?) -> FlutterError? {
		eventSink = nil
		return nil
	}
}
