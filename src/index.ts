import { registerPlugin } from '@capacitor/core';

import type { NativeGoogleAuthPlugin } from './definitions';

export * from './definitions';

export const NativeGoogleAuth = registerPlugin<NativeGoogleAuthPlugin>(
  'NativeGoogleAuthPlugin',
  {
    web: () => import('./web').then(m => new m.NativeGoogleAuthWeb()),
  },
);
