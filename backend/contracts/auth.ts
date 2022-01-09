import Account from 'App/Models/Account'
declare module '@ioc:Adonis/Addons/Auth' {
  interface ProvidersList {
    accounts: {
      implementation: LucidProviderContract<typeof Account>
      config: LucidProviderConfig<typeof Account>
    }
  }
  interface GuardsList {
    api: {
      implementation: OATGuardContract<'accounts', 'api'>
      config: OATGuardConfig<'accounts'>
    }
  }
}
