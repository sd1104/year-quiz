<template>
  <div>
    <header>
      <quiz-header></quiz-header>
    </header>

    <main class="container">
      <quiz-content></quiz-content>
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

export default {
  name: "QuizPage1",
  components: {
    QuizHeader,
    QuizFooter,
    QuizContent
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>