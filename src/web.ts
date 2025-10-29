import { WebPlugin } from '@capacitor/core';

import type {
  NativeGoogleAuthPlugin,
  NativeGoogleAuthResponse,
  NativeGoogleAuthSignInOptions,
} from './definitions';

export class NativeGoogleAuthWeb
  extends WebPlugin
  implements NativeGoogleAuthPlugin
{
  async signIn(
    _options?: NativeGoogleAuthSignInOptions,
  ): Promise<NativeGoogleAuthResponse> {
    throw this.unimplemented('NativeGoogleAuth is not implemented on web.');
  }
}
