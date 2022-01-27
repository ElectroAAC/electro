import { Middleware } from '@nuxt/types'

const dashboard: Middleware = ({ store, redirect}) => {
  if (!store.state.auth.token || store.state.accounts.account.account.group_id !== 6) {
    return redirect('/');
  }
}

export default dashboard;