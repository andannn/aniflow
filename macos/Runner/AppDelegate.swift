import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
    static let channelName = "com.andannn.animetracker/auth"
    private var eventSink: FlutterEventSink?

    override func applicationDidFinishLaunching(_ notification: Notification) {
        guard let controller = mainFlutterWindow?.contentViewController as? FlutterViewController else { return }
        let eventChannel = FlutterEventChannel(name: AppDelegate.channelName, binaryMessenger: controller.engine.binaryMessenger)
        eventChannel.setStreamHandler(self)

        super.applicationDidFinishLaunching(notification)
    }

    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication)    -> Bool {
      return true
    }

    override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
      return true
    }
}


extension AppDelegate: FlutterStreamHandler {
    override func application(_ application: NSApplication, open urls: [URL]) {
        for url in urls {
            if url.scheme == "animetracker" {
                eventSink?(url.absoluteString.replacingOccurrences(of: "#", with: "?"))
                eventSink?(FlutterEndOfEventStream)
                eventSink = nil
            }
        }
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
