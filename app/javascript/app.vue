<template>
  <router-view></router-view>
</template>

<script>
  import Vue from 'vue'
  import VueRouter from 'vue-router'

  import Index from 'Index.vue'
  import QuizPage1 from 'QuizPage1.vue'

  const router = new VueRouter ({
    routes: [
      { path: '/',
        name: 'Index',
        component: Index },
      { path: '/quiz/page1/',
        name: 'QuizPage1',
        component: QuizPage1}
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
