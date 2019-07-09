<template>
    <div>
      <div class="heading">Materials</div>
      <hr>
      <div>
        <basic-material></basic-material>
      </div>
    </div>
</template>

<script>
import basicMaterial from './materials/basicMaterial'

export default {
  name: 'Materials',
  components: {
    'basic-material': basicMaterial
  }
}
</script>

<style>
  .heading {
    font-size: 1.2em;
    padding-top: 0.6em;
  }
</style>
