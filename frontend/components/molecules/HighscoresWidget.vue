<template>
  <aside class="widget">
    <h5 class="widget-title"> Highscores </h5>
    <v-container class="text-center">
      <div
        v-for="(player, idx) in players"
        :key="idx"
      >
        <CharacterAvatar :avatar="player.vocation" width="60px"/> <br>
        <span> {{ player.name }} </span> <br>
        <span> {{ player.level }}. {{ player.vocation }} </span>
      </div>
    </v-container>
  </aside>
</template>

<script lang="ts">
export default {
  data() {
    return {
      players: [
        {
          id: 1,
          name: 'Orc Sample',
          level: '8',
          vocation: 'Orc'
        },
        {
          id: 2,
          name: 'Witch Sample',
          level: '8',
          vocation: 'Witch'
        },
        {
          id: 3,
          name: 'Lizard Sample',
          level: '8',
          vocation: 'Lizard'
        },
        {
          id: 4,
          name: 'Demon Sample',
          level: '8',
          vocation: 'Demon'
        },
        {
          id: 5,
          name: 'Warrior Sample',
          level: '8',
          vocation: 'Warrior'
        },
      ]
    }
  }
}
</script>