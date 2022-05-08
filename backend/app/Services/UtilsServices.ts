
export default class UtilsService {
  public generatePlayerLink(remote_url: string, player_name: string): String {  
    try {
      const url = remote_url + '/' + player_name;
      return `<a href="${url}"> ${player_name}</a>`;
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}