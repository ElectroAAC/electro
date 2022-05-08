import { BasePolicy } from '@ioc:Adonis/Addons/Bouncer'
import Account from 'App/Models/Account'
import Role from 'Contracts/enums/Role'

export default class Dashboard extends BasePolicy {
	public async before(account: Account | null) {
    if (account?.type === Role.ADMIN)
      return true;
  }

	public async admin(account: Account) {
		if (account.type === Role.ADMIN)
      return true;
	}
}
