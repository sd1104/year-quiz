<template>
  <div class="container">
    <main>
      <article>

        <section>

        </section>

      </article>
    </main>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      quizCount: 1,
      totalQuizCount: 0,
      totalCorrectCount: 0,
      quizzes: [
        {
          title: "",
          correct:"",
          uncorrect1: "",
          uncorrect2: "",
          explanation: ""
        }
      ],
      quizChoices: [],
      showQuiz: true,
      showExplanation: false,
      hidden: false,
      alertMessage: false,
      result: "",
      axiosUrl: ""
    };
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