import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Shop'
import { 
  AccountView,
  Account,
  ShopItemView,
  ShopCommunicationRepository,
  ShopHistoryRepository
} from 'App/Services'

export default class ShopController {
  public accountView: AccountView = new AccountView();
  public accountService: Account = new Account();
  public shopItemView: ShopItemView = new ShopItemView();
  public shopCommunicationRepository: ShopCommunicationRepository = new ShopCommunicationRepository();
  public shopHistoryRepository: ShopHistoryRepository = new ShopHistoryRepository();

  public async store(ctx: HttpContextContract) {
    try {
      const validator = await ctx.request.validate(StoreValidator);

      const account = ctx.auth.user;
      
      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }
      
      if (validator.from_account_id !== account.id) {
        return ctx.response.status(404).send({ message: "The account is not yours."});
      }
      
      const offers: any = await Promise.all(validator.items.map(async (item) => 
        await this.shopItemView.getOfferById(item.itemId)
      ));

      const totalPrice = offers.map((offer: any) => {
        if (!offer.length) {
          throw new Error("OfferId invalid!");
        }
        return offer[0].price;
      }).reduce((total: number, value: number) => total + value, 0);

      if (totalPrice > account.premium_points) {
        return ctx.response.status(404).send({ message: `You don't have enough points. The total amount is: ${totalPrice} and you have: ${account.premium_points}`});
      }

      const communications = await Promise.all(offers.map(async (offer: any) => {
        return await this.shopCommunicationRepository.insert({
          player_id: validator.to_player_id,
          type: 'login',
          action: 'give_item',
          itemId1: offer[0].itemId1,
          count1: offer[0].count1,
          itemId2: offer[0].itemId2 ,
          count2: offer[0].count2,
          category_name: offer[0].category_name,
          offer_name: offer[0].name,
          param7: '',
        })
      }));
      
      await Promise.all(communications.map(async (communication, index) => {
        return this.shopHistoryRepository.insert({
          communication_id: communication[0],
          from_account_id: validator.from_account_id,
          from_nick: validator.from_nick,
          to_account_id: validator.to_account_id,
          to_player_id: validator.to_player_id,
          price: offers[index][0].price,
          offer_id: offers[index][0].id,
          status: 'realized',
          is_pacc: 0
        })
      }));

      await this.accountService.removePremiumPoints(account.id, totalPrice);

      return ctx.response.status(200).send({ status: 200, message: 'Purchase made successfully!'});
    } catch (err) {
      console.log('Error purchase Query: ', err);
      return ctx.response.badRequest(err.messages);
    }
  }
}