<template>
  <article class="container">
    <section>
      <div v-if="hidden">
        <h5>
          問題{{ quizNumber }}
          {{ quizzes[quizNumber - 1].title }}
        </h5>
        <div v-if="showQuiz">
          <div>
            <ul v-for="choice in quizChoices" :key="choice.id">
              <li @click="ShowAnswer(choice)">
                {{ choice }}
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="p-quiz__explain" v-if="showExplanation">
        <h2 class="is-correct" v-if="judgement">
          <i class="far fa-circle mr-4"></i>正解！
        </h2>
        <h2 class="is-uncorrect" v-else>
          <i class="fas fa-times mr-4"></i>不正解
        </h2>
        <p>
          <strong>解説：</strong>
          {{quizzes[quizNumber-1].explanation}}
        </p>
        <button @click="Next()" type="button" class="btn btn-default">次へ</button>
      </div>

      <div v-if="showResult">
        <h4>結果</h4>
        <p>
          正解数は
          <br>
          <span class="result-count">
            {{ totalCorrectCount }}問
          </span>
          ／５問でした
        </p>
        <router-link :to="{ name: 'Index'}" id="router-link">
          <span class="nav-title">
            トップへ
          </span>
        </router-link>
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
      console.log('insert')
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
    },
    // ResetQuiz: function() {
    //   this.quizNumber = 1;
    //   this.totalCorrectCount = 0;
    // }
  }
}
</script>

<style scoped>
p {
  font-size: 16px;
  text-align: center;
}
</style>