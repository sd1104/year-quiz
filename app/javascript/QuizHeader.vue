<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light header" style="background-color: #e3f2fd;">
      <router-link :to="{ name: 'Index'}" id="router-link" >
        <span class="nav-title">
          クイズ -90sの思い出-
        </span>
      </router-link>

      <div class="hamburger_btn" @click=' menuToggle = !menuToggle '>
        <span class="line line_01" v-bind:class="{'btn_line01':menuToggle}"></span>
        <span class="line line_02" v-bind:class="{'btn_line02':menuToggle}"></span>
        <span class="line line_03" v-bind:class="{'btn_line03':menuToggle}"></span>
      </div>
    </nav>

    <transition name="menu">
      <div class="menu-paper" v-show="menuToggle">
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
    </transition>
  </div>


</template>

<script>
export default {
  name: "QuizHeader",
  data: function () {
    return {
      menuToggle: false,
      menuBtn: '<i class="fas fa-bars"></i>',
      closeBtn: '<i class="fas fa-times"></i>',
      menuPaper: false,
    };
  },
  methods: {
    MenuToggle: function() {
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