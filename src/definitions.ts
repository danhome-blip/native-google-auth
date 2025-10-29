export interface NativeGoogleAuthSignInOptions {
  /**
   * Additional OAuth scopes to request alongside the default profile/email scopes.
   */
  scopes?: string[];
}

export type NativeGoogleAuthResponse = {
  idToken: string;
  accessToken?: string;
};

export interface NativeGoogleAuthPlugin {
  signIn(
    options?: NativeGoogleAuthSignInOptions,
  ): Promise<NativeGoogleAuthResponse>;
}
