<template>
  <article class="container">
    <section>
      <div v-if="hidden" class="quiz-card">
        <h5 class="quiz-title">
          問題{{ quizNumber }}
          {{ quizzes[quizNumber - 1].title }}
        </h5>

        <div v-if="showQuiz">
          <div class="quiz-choice">
            <ul v-for="choice in quizChoices" :key="choice.id">
              <button type="button" class="btn btn-outline-secondary">
                <li @click="ShowAnswer(choice)">
                  {{ choice }}
                </li>
              </button>
            </ul>
          </div>
        </div>

        <div class="p-quiz__explain" v-if="showExplanation">
          <div class="quiz-explanation-body">
            <h2 class="correct-answer" v-if="judgement">
              <i class="far fa-circle mr-4"></i>
              正解！
            </h2>
            <h2 class="uncorrect-answer" v-else>
              <i class="fas fa-times mr-4"></i>
              不正解
            </h2>
            <div class="quiz-explanation">
              <strong>解説：</strong>
              {{quizzes[quizNumber-1].explanation}}
            </div>
            <button @click="Next()" type="button" class="quiz-btn">次へ</button>
          </div>
        </div>
      </div>

      <div v-if="showResult">
        <div class="quiz-card">
          <h4 class="result-title">結果</h4>
          <div class="quiz-result-body">
            <div class="result-paresetation">
              正解数は
              <br>
              <span class="result-count">
                {{ totalCorrectCount }}問
              </span>
              ／５問でした
            </div>
            <router-link :to="{ name: 'Index'}" id="router-link">
              <button type="button" class="result-btn">
                トップへ
              </button>
            </router-link>
          </div>
        </div>
      </div>

    </section>

    <!-- <pre>
      {{ $data }}
    </pre> -->

    <section v-if="alertMessage">
      <p>
        <i></i>クイズはまだ登録されていません。
        <i></i>
      </p>
      <router-link :to="{ name: 'Index'}" id="router-link">
        <span class="nav-title">
          トップへ
        </span>
      </router-link>
    </section>

  </article>

</template>

<script>
import axios from 'axios';

export default {
  name: "QuizContent",
  data: function () {
    return {
      quizNumber: 1,
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
      showResult: false
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
          // console.log(`quizzes:${this.quizzes}`);
          this.totalQuizCount = this.quizzes.length;
          // console.log(`totalQuizCount:${this.totalQuizCount}`);

          if (this.totalQuizCount) {
            this.hidden = true;
          } else {
            this.alertMessage = true;
          }
          this.InsertChoices(this.quizNumber - 1);
          // console.log(`quizNumber:${this.quizNumber}`);
        })
        .catch(error => {
          console.log(error);
        });
    },
    shuffleQuizzes: function(quizChoices) {
      const choices = quizChoices.slice();
      // console.log(choices)
      for ( let i = choices.length -1; 0 < i; i--) {
        let r = Math.floor(Math.random() * ( i + 1 ));
        [ choices[i], choices[r] ] = [ choices[r], choices[i]];

        // console.log(`i:${i}`)
        // console.log(`r:${r}`)
        // console.log(`choices[i]:${choices[i]}`)
        // console.log(`choices[r]:${choices[r]}`)
        // console.log(`Math.random:${Math.random()}`)
        // console.log(`choices:${choices}`)
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

      // console.log(`index:${index}`);
      // console.log(`quizChoices[${index}].correct:${this.quizzes[index].correct}`);
    },
    ShowAnswer: function(choice) {
      this.showQuiz = !this.showQuiz;
      this.showExplanation = !this.showExplanation;

      let answer = this.quizzes[this.quizNumber - 1].correct;
      if (choice === answer) {
        this.judgement = true;
        this.totalCorrectCount++;
      } else {
        this.judgement = false;
      }
    },
    Next: function() {
      if (this.quizNumber < this.totalQuizCount) {
        this.showQuiz = true;
        this.showExplanation = false;
        this.quizNumber++;
      } else {
        this.ShowResult();
      }
    },
    ShowResult: function() {
      this.hidden = false;
      this.showQuiz = false;
      this.showExplanation = false;
      this.showResult = true;
    }
  }
}
</script>

<style scoped>
p {
  font-size: 16px;
  text-align: center;
}
</style>