import Bouncer from '@ioc:Adonis/Addons/Bouncer'

export const { actions } = Bouncer;

export const { policies } = Bouncer.registerPolicies({
  DashboardPolicy: () => import('App/Policies/Dashboard')
})
