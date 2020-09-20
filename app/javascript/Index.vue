<template>
  <div>
    <header>
      <quiz-header></quiz-header>
    </header>

    <main class="container">
      <router-link :to="{ name: 'QuizPage1'}">
        QuizPage1
      </router-link>
    </main>

    <footer>
      <quiz-footer></quiz-footer>
    </footer>
  </div>
</template>

<script>
import QuizHeader from "QuizHeader.vue"
import QuizFooter from "QuizFooter.vue"
import QuizContent from "QuizContent.vue"
import axios from 'axios';

export default {
  name: "QuizIndex",
  components: {
    QuizHeader,
    QuizFooter,
    QuizContent
  },
  data: function () {
    return {
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