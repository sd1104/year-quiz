<template>
  <div id="app">
    <ul v-for="quiz in quizzes" :key="quiz.id">
      <li>{{ quiz.title }}</li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      quizzes: []
    }
  },
  mounted() {
    axios
      .get('/api/v1/quizzes.json')
      .then(response => (this.quizzes = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>