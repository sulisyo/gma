import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
       _ application: UIApplication,
       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

       let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
       let methodCannel = FlutterMethodChannel(name: "cobacoba",
                                                 binaryMessenger: controller.binaryMessenger)
       methodCannel.setMethodCallHandler({
         (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
           let argument = call.arguments as? [String: Any]
           if(call.method == "getResult"){
               let from = argument?["from"] as? String
               let message = "iOS say hi " + (from ?? "")
               result(message)
           }
       })

       GeneratedPluginRegistrant.register(with: self)
       return super.application(application, didFinishLaunchingWithOptions: launchOptions)
     }
}
