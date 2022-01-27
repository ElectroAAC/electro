import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { TopPremiumPoints, Vocations } from '@/models'

import { vocations as VocationList } from '@/utils/enum'

import { getVocationName } from '@/utils/methods'
@Module({
  name: 'dashboard/home',
  stateFactory: true,
  namespaced: true
})

export default class Home extends VuexModule {
  private totalAccounts = 0;
  private totalPlayers = 0;
  private totalGuilds = 0;
  private topPremiumPoints = [] as TopPremiumPoints[];
  private vocations = [] as { vocation_name?: String; total?: Number; }[];

  public get $totalAccounts() {
    return this.totalAccounts;
  }

  public get $totalPlayers() {
    return this.totalPlayers;
  }

  public get $totalGuilds() {
    return this.totalGuilds;
  }

  public get $topPremiumPoints() {
    return this.topPremiumPoints;
  }

  public get $vocations() {
    return this.vocations;
  }

  @Mutation
  private UPDATE_ACCOUNTS(total: number) {
    this.totalAccounts = total
  }

  @Mutation
  private UPDATE_PLAYERS(total: number) {
    this.totalPlayers = total
  }

  @Mutation
  private UPDATE_GUILDS(total: number) {
    this.totalGuilds = total
  }

  @Mutation
  private UPDATE_TOP_PREMIUM_POINTS(topPremiumPoints: TopPremiumPoints[]) {
    this.topPremiumPoints = topPremiumPoints
  }

  @Mutation
  private UPDATE_VOCATIONS(vocations: Vocations[]) {
    const totalVocations: { vocation_name: String, total: number }[] = [];

    VocationList.forEach((vocation) => {
      totalVocations.push({
        vocation_name: vocation.text,
        total: 0
      });
    })

    vocations.forEach((item: Vocations) => {
      const voc = getVocationName(item.vocation);
      const vocation = totalVocations.findIndex((vocation) => vocation.vocation_name === voc);
      if (vocation >= 0) {
        totalVocations[vocation].total += item.total.valueOf();
      }
    });

    this.vocations = totalVocations;
  }

  @Action
  public async getTotalAccounts() {
    try {
      await $axios.$get('dashboard/accounts')
        .then((res) => {
          if (!res) 
            throw new Error("Failed to getTotalAccounts");

          this.context.commit('UPDATE_ACCOUNTS', res.result[0].total);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_ACCOUNTS', 0);
          return 400;
        });
      return 200;
    } catch(err) {
      this.context.commit('UPDATE_ACCOUNTS', 0);
      return 400;
    }
  }

  @Action
  public async getTotalPlayers() {
    try {
      await $axios.$get('dashboard/players')
        .then((res) => {
          if (!res) 
            throw new Error("Failed to getTotalPlayers");

          this.context.commit('UPDATE_PLAYERS', res.result[0].total);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_PLAYERS', 0);
          return 400;
        });
      return 200;
    } catch(err) {
      this.context.commit('UPDATE_PLAYERS', 0);
      return 400;
    }
  }

  @Action
  public async getTotalGuilds() {
    try {
      await $axios.$get('dashboard/guilds')
        .then((res) => {
          if (!res) 
            throw new Error("Failed to getTotalGuilds");

          this.context.commit('UPDATE_GUILDS', res.result[0].total);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_GUILDS', 0);
          return 400;
        });
      return 200;
    } catch(err) {
      this.context.commit('UPDATE_GUILDS', 0);
      return 400;
    }
  }

  @Action
  public async getTopPremiumPoints() {
    try {
      await $axios.$get('dashboard/premium-points')
        .then((res) => {
          if (!res) 
            throw new Error("Failed to getTopPremiumPoints");

          this.context.commit('UPDATE_TOP_PREMIUM_POINTS', res.result);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_TOP_PREMIUM_POINTS', []);
          return 400;
        });
      return 200;
    } catch(err) {
      this.context.commit('UPDATE_TOP_PREMIUM_POINTS', []);
      return 400;
    }
  }

  @Action
  public async getTotalVocationId() {
    try {
      await $axios.$get('dashboard/vocations')
        .then((res) => {
          if (!res) 
            throw new Error("Failed to getTotalVocationId");

          this.context.commit('UPDATE_VOCATIONS', res.result);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_VOCATIONS', []);
          return 400;
        });
      return 200;
    } catch(err) {
      this.context.commit('UPDATE_VOCATIONS', []);
      return 400;
    }
  }
}
