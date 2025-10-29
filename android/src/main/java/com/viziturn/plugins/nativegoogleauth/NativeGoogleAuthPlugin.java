package com.viziturn.plugins.nativegoogleauth;

import com.getcapacitor.PluginCall;

public class NativeGoogleAuthPlugin {

    public void signIn(PluginCall call) {
        call.reject(
            "google_signin_not_implemented",
            "Native Google sign-in is not implemented on Android yet."
        );
    }
}
