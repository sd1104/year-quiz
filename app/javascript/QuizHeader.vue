<template>
  <nav class="navbar navbar-expand-lg navbar-light header" style="background-color: #e3f2fd;">
    <router-link :to="{ name: 'Index'}" id="router-link">
      <span class="nav-title">
        クイズ -30sの思い出-
      </span>
    </router-link>

    <div @click="MenuToggle" v-if="menuToggle" v-html="menuBtn">
      <transition name="fade">
        {{ menuBtn }}
      </transition>
    </div>
    <div @click="MenuToggle" v-else v-html="closeBtn">
      {{ closeBtn }}
    </div>

  </nav>
</template>

<script>
export default {
  name: "QuizHeader",
  data: function () {
    return {
      menuToggle: true,
      menuBtn: '<i class="fas fa-bars"></i>',
      closeBtn: '<i class="fas fa-times"></i>'
    };
  },
  methods: {
    MenuToggle: function() {
      console.log('test')
      if (this.menuToggle === true) {
        this.menuToggle = false;
      } else {
        this.menuToggle = true
      }
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>