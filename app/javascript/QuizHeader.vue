<template>
  <nav class="navbar navbar-expand-lg navbar-light header" style="background-color: #e3f2fd;">
    <router-link :to="{ name: 'Index'}" id="router-link">
      <span class="nav-title">
        クイズ -30sの思い出-
      </span>
    </router-link>
  </nav>
</template>

<script>
export default {
  name: "QuizHeader",
  data: function () {
    return {
      message: 'Header parts'
    };
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>