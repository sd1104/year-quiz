<template>
  <router-view></router-view>
</template>

<script>
  import Vue from 'vue'
  import VueRouter from 'vue-router'

  import QuizIndex from 'QuizIndex.vue'

  const router = new VueRouter ({
    routes: [
      { path: '/',
        component: QuizIndex }
    ]
  })
  Vue.use(VueRouter)
  export default {
    router
  }

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
