# native-google-auth

ViziTurn Native Google Auth plugin for secure OAuth login on iOS (Capacitor 7)

## Install

```bash
npm install native-google-auth
npx cap sync
```

## API

<docgen-index>

* [`signIn(...)`](#signin)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### signIn(...)

```typescript
signIn(options?: NativeGoogleAuthSignInOptions | undefined) => Promise<NativeGoogleAuthResponse>
```

| Param         | Type                                                                                    |
| ------------- | --------------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#nativegoogleauthsigninoptions">NativeGoogleAuthSignInOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#nativegoogleauthresponse">NativeGoogleAuthResponse</a>&gt;</code>

--------------------


### Interfaces


#### NativeGoogleAuthSignInOptions

| Prop         | Type                  | Description                                                                    |
| ------------ | --------------------- | ------------------------------------------------------------------------------ |
| **`scopes`** | <code>string[]</code> | Additional OAuth scopes to request alongside the default profile/email scopes. |


### Type Aliases


#### NativeGoogleAuthResponse

<code>{ idToken: string; accessToken?: string; }</code>

</docgen-api>
