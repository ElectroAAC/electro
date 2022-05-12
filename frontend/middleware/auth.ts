import { Middleware } from '@nuxt/types'

const auth: Middleware = ({ store, redirect, $toast}) => {
  if (!store.state.auth.token) {
    $toast.error(
      'You need to be authenticated.',
      {
        keepOnHover: true,
        duration: 2000,
        theme: "bubble",
      }
    )
    return redirect('/');
  }
}

export default auth;