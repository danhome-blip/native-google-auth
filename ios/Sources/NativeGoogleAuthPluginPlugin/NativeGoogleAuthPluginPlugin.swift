import Foundation
import Capacitor

@objc(NativeGoogleAuthPluginPlugin)
public class NativeGoogleAuthPluginPlugin: CAPPlugin, CAPBridgedPlugin {
  public let identifier = "NativeGoogleAuthPlugin"
  public let jsName = "NativeGoogleAuthPlugin"
  public let pluginMethods: [CAPPluginMethod] = [
    CAPPluginMethod(name: "signIn", returnType: CAPPluginReturnPromise)
  ]

  private let implementation = NativeGoogleAuthPlugin()

  @objc func signIn(_ call: CAPPluginCall) {
    implementation.signIn(call, bridge: self.bridge!)
  }
}