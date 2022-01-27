import { BasePolicy } from '@ioc:Adonis/Addons/Bouncer'
import Account from 'App/Models/Account'
import Role from 'Contracts/enums/Role'

export default class Dashboard extends BasePolicy {
	public async before(account: Account | null) {
    if (account?.group_id === Role.ADMIN)
      return true;
  }

	public async viewList(account: Account) {
		if (account.group_id === Role.ADMIN)
      return true;
	}
}
