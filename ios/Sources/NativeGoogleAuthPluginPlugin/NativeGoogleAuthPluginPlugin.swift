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
    guard let bridge = bridge else {
      call.reject("bridge_unavailable", "Capacitor bridge is not available.")
      return
    }

    implementation.signIn(call, bridge: bridge)
  }
}
