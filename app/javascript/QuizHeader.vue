<template>
  <p>{{ message }}</p>
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