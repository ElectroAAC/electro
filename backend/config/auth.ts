import { AuthConfig } from '@ioc:Adonis/Addons/Auth'

const authConfig: AuthConfig = {
  guard: 'api',
  guards: {
    api: {
      driver: 'oat',

      tokenProvider: {
        type: 'api',
        driver: 'database',
        table: 'api_tokens',
        foreignKey: 'account_id',
      },

      provider: {
        driver: 'lucid',
        identifierKey: 'id',
        uids: ['name'],
        model: () => import('App/Models/Account'),
      },
    },
  },
}

export default authConfig
