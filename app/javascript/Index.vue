<template>
  <div>
    <header>
      <quiz-header></quiz-header>
    </header>

    <main>
      <div id="TOP">

        <div class="top-img">

          <div class="slider-outer">
            <transition name="fade">
              <div class="slider-inner" v-if="currentSlide === index" v-for="(slide, index) in slides" :key="index" >
                <img class="slide-img" v-bind:src="slides[index].image" :key="slides[index].image" id="index-image">
              </div>
            </transition>
          </div>

          <div class="quiz-link">
            <div class="intro-sentence">
              <span class="Title">クイズ 90sの思い出 </span>へようこそ。1990年代の出来事を年号クイズでどうぞ。
            </div>
            <router-link :to="{ name: 'QuizPage1'}">
              <button type="button" class="result-btn">
                クイズへ
              </button>
            </router-link>
          </div>

        </div>

        <div class="top-introduction">
          <h5 class="intro-title">〜　クイズ 30sの思い出　〜</h5>
          <div class="quiz-explain">
            １９９0年代の懐かしい？出来事をクイズにしました。
            あんなことや、こんなことがありましたね。
            <br>令和になった頃に３０代の人には、記憶に残っている出来事が多いはず。
            <br>つまり、よく分かるほど３０代ってことですね。
            いわゆる昭和生まれです。
          </div>
        </div>

      </div>

    </main>

    <footer>
      <quiz-footer></quiz-footer>
    </footer>
  </div>
</template>

<script>
import QuizHeader from "QuizHeader.vue"
import QuizPage1 from "QuizPage1.vue"
import QuizFooter from "QuizFooter.vue"

export default {
  name: "Index",
  components: {
    QuizHeader,
    QuizFooter,
    QuizPage1
  },
  data: function () {
    return {
      currentSlide: 0,
      slides: [
        { image: require('./assets/images/90s2.png') },
        { image: require('./assets/images/90s5.png') },
        { image: require('./assets/images/90s6.png') },
        { image: require('./assets/images/90s7.png') }
      ]
    };
  },
  mounted() {
    setInterval(() => {
      this.currentSlide = this.currentSlide < this.slides.length -1 ? this.currentSlide +1 : 0
    }, 7000)
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>