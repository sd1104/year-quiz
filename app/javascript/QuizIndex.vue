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
      judgement: "",
    };
  },
  created() {
    this.InsertQuizzes();
  },
  methods: {
    InsertQuizzes() {
      axios
        .get('api/v1/quizzes.jason')
        .then( response => {
          this.quizzes = response.data;
          console.log(`quizzes:${this.quizzes}`);
          this.totalQuizCount = this.quizzes.length;
          console.log(`totalQuizCount:${this.totalQuizCount}`);

          if (this.totalQuizCount) {
            this.hidden = true;
          } else {
            this.alertMessage = true;
          }
          this.InsertChoices(this.quizCount - 1);
          console.log(`quizCount:${this.quizCount}`);
        })
        .catch(error => {
          console.log(error);
        });
    },
    shuffleQuizzes: function(quizChoices) {
      const choices = quizChoices.slice();
      for ( let i = choices.length -1; 0 < i; i--) {
        let r = Math.floor(Math.random() * ( i + 1 ));
        [ choices[i], choices[r] = [ choices[r], choices[i]]];

        console.log(`i:${i}`)
        console.log(`r:${r}`)
        console.log(`choices[i]:${choices[i]}`)
        console.log(`choices[r]:${choices[r]}`)
        console.log(`Math.random:${Math.random()}`)
        console.log(`choices:${choices}`)
      }
      return choices;
    },
    InsertChoices: function(index) {
      this.quizChoices = [];
      this.quizChoices.push(
        this.quizzes[index].correct,
        this.quizzes[index].uncorrect1,
        this.quizzes[index].uncorrect2
      );
      this.quizChoices = this.shuffleQuizzes(this.quizChoices)

      console.log(`index:${index}`);
      console.log(`quizChoices[${index}].correct:${this.quizzes[index].correct}`);
    },
    ShowAnswer: function(choice) {
      this.showQuiz = !this.showQuiz;
      this.showExplanation = !this.showExplanation;

      let answer = this.quizzes[this.quizCount - 1].correct;
      if (choice === answer) {
        this.judgement = true;
        this.totalCorrectCount++;
        this.$ref.totalCorrectCount;
      } else {
        this.judgement = false;
      }
    },
    Next: function() {
      if (this.quizCount < this.totalQuizCount) {
        this.showQuiz = true;
        this.showExplanation = false;
        this.quizCount++;
        this.nextcounter++;
        this.InsertChoices(this.quizCount - 1);
      } else {
        this.$refs.result.showResult();
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