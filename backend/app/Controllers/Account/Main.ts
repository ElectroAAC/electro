import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class AccountController {
  public async show({ auth }: HttpContextContract) {
    const account = auth.user!;
    /**
     * @TODO => Filtrar somente os dados que devem ser retornados a fins de consumo no frontend
     */
    return account;
  }
}