package com.viziturn.plugins.nativegoogleauth;

import com.getcapacitor.Logger;

public class NativeGoogleAuthPlugin {

    public String echo(String value) {
        Logger.info("Echo", value);
        return value;
    }
}
