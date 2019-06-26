// material master table page
// folder: mastersPages

<template>
    <div>
        <div id="matMastTable">
            <b-table class="small small" striped hover :items="items" :per-page=10 @row-clicked="rowClicked"></b-table>
        </div>
    </div>
</template>

<script>
export default {
  name: 'materialMaster',
  data () {
    return {
      compTitle: 'Material Master',
      items: []
    }
  },
  methods: {
    // display material master table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'material master'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after clicking row of table
    rowClicked: function () {}
  },
  // display every time before mounting vue
  beforeMount () {
    this.allRecords()
  }
}
</script>

<style>

</style>
