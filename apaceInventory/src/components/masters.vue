<template>
    <div>
        <div class="heading" @click="allRecords">Masters</div>
        <hr>
        <div id="tableDisplay">
          <b-table striped hover :items="items"></b-table>
        </div>
    </div>
</template>

<script>
export default {
  name: 'masters',
  data () {
    return {
      items: []
    }
  },
  methods: {
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php')
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  }
}
</script>

<style scoped>
  .heading {
    font-size: 1.2em;
    padding-top: 0.6em;
  }
</style>
