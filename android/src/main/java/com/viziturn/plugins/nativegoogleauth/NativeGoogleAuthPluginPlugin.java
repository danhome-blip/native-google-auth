package com.viziturn.plugins.nativegoogleauth;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "NativeGoogleAuthPlugin")
public class NativeGoogleAuthPluginPlugin extends Plugin {

    private final NativeGoogleAuthPlugin implementation = new NativeGoogleAuthPlugin();

    @PluginMethod
    public void signIn(PluginCall call) {
        implementation.signIn(call);
    }
}
