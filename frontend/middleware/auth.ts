import { Middleware } from '@nuxt/types'

const auth: Middleware = ({ store, redirect, $toast}) => {
  if (!store.state.auth.token) {
    if ($toast)
      $toast.error(
        'You need to be authenticated.',
        {
          duration: 2000,
          theme: "bubble",
        }
      )
    return redirect('/');
  }
}

export default auth;