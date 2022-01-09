import { Store, ActionTree } from 'vuex'
import { initializeStores } from '@/utils/store-util'

const initializer = (store: Store<any>) => initializeStores(store)

export const plugins = [ initializer ]
export const strict = false
export * from '@/utils/store-util'

const state = () => ({})
type RootState = ReturnType<typeof state>

export const actions: ActionTree<RootState, RootState> = {
  nuxtServerInit({ dispatch }) {
    dispatch('auth/update')
  }
}