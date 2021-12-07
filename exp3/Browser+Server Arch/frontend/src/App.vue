<template>
  <query-view />
</template>

<script>
import QueryView from './components/QueryView.vue'

export default {
  name: 'App',
  components: {
    QueryView
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
