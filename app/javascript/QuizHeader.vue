<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light header" style="background-color: #e3f2fd;">
      <router-link :to="{ name: 'Index'}" id="router-link" >
        <span class="nav-title">
          クイズ -30sの思い出-
        </span>
      </router-link>

      <div @click="MenuToggle" v-if="menuToggle" v-html="menuBtn">
        {{ menuBtn }}
      </div>
      <div @click="MenuToggle" v-else v-html="closeBtn">
        {{ closeBtn }}
      </div>
    </nav>

    <div>
      <div class="menu-paper" v-if="menuPaper">
        <ul class="menu-paper-lists">
          <li class="menu-paper-list">
            <router-link :to="{ name: 'Index'}" id="router-link">
              <span class="nav-title">
                トップ
              </span>
            </router-link>
          </li>
          <li class="menu-paper-list">
            <router-link :to="{ name: 'QuizPage1'}">
              <span class="nav-title">
                クイズ
              </span>
            </router-link>
          </li>
        </ul>

      </div>
    </div>
  </div>


</template>

<script>
export default {
  name: "QuizHeader",
  data: function () {
    return {
      menuToggle: true,
      menuBtn: '<i class="fas fa-bars"></i>',
      closeBtn: '<i class="fas fa-times"></i>',
      menuPaper: false,
    };
  },
  methods: {
    MenuToggle: function() {
      console.log('test')
      if (this.menuToggle === true) {
        this.menuToggle = false;
        this.menuPaper = true;
      } else {
        this.menuToggle = true
        this.menuPaper = false;
      }
    }
  }
}
</script>

<style scoped>
</style>