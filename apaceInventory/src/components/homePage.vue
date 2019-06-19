<template>
    <div id="homePageDiv" class="flex-container">
      <div id="appHeaderDiv">
        <appHeader/>
      </div>
      <div id="sideMenuDiv">
        <sideMenu/>
      </div>
    </div>
</template>

<script>
import appHeader from './appHeader.vue'
import sideMenu from './sideMenu.vue'

export default {
  name: 'homePage',
  components: {
    appHeader,
    sideMenu
  }
}
</script>

<style>
  .flex-container {
    display: flex;
    flex-direction: column;
  }
</style>
