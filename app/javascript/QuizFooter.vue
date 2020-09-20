<template>
  <p>{{ message }}</p>
</template>

<script>
export default {
  name: "QuizHeader",
  data: function () {
    return {
      message: 'Footer Parts'
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