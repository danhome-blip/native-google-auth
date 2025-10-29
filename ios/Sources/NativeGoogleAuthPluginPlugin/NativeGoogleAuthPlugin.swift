import Foundation
import Capacitor
import FirebaseCore
import GoogleSignIn

@objc public class NativeGoogleAuthPlugin: NSObject {
  private var isFirebaseConfigured = false

  @objc public func signIn(_ call: CAPPluginCall, bridge: CAPBridgeProtocol) {
    configureFirebaseIfNeeded()

    guard let clientID = FirebaseApp.app()?.options.clientID, !clientID.isEmpty else {
      call.reject(
        "google_signin_missing_client_id",
        "The Firebase client ID is missing. Check your GoogleService-Info.plist configuration."
      )
      return
    }

    guard let viewController = bridge.viewController else {
      call.reject(
        "missing_presenting_view_controller",
        "Unable to locate the presenting view controller."
      )
      return
    }

    let additionalScopes = call.getArray("scopes", String.self)?
      .compactMap { scope in
        let trimmed = scope.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? nil : trimmed
      } ?? []

    GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)

    DispatchQueue.main.async {
      let completion: (GIDSignInResult?, Error?) -> Void = { result, error in
        if let error = error as NSError? {
          if error.domain == GIDSignInErrorDomain &&
            (error.code == GIDSignInErrorCode.canceled.rawValue ||
             error.code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue) {
            call.reject("google_signin_cancelled", "User cancelled the Google sign-in flow.")
          } else {
            call.reject("google_signin_failed", error.localizedDescription)
          }
          return
        }

        guard let result = result else {
          call.reject("google_signin_no_result", "Google sign-in did not return a result.")
          return
        }

        let response: [String: Any] = [
          "idToken": result.user.idToken?.tokenString ?? "",
          "accessToken": result.user.accessToken.tokenString
        ]

        call.resolve(response)
      }

      let scopesArgument: [String]? = additionalScopes.isEmpty ? nil : additionalScopes
      GIDSignIn.sharedInstance.signIn(
        withPresenting: viewController,
        hint: nil,
        additionalScopes: scopesArgument,
        completion: completion
      )
    }
  }

  private func configureFirebaseIfNeeded() {
    guard !isFirebaseConfigured else {
      return
    }

    if FirebaseApp.app() == nil {
      FirebaseApp.configure()
    }

    isFirebaseConfigured = true
  }
}
