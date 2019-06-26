// material type master table
// folder: mastersPages

<template>
    <div>
        <div id="matTypeMastTable">
            <b-table class="small small" striped hover :items="items" @row-clicked="rowClicked"></b-table>
        </div>
    </div>
</template>

<script>
export default {
  name: 'materialTypeMaster',
  data () {
    return {
      compTitle: 'Material Type Master',
      items: []
    }
  },
  methods: {
    // display material type master table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'material type master'
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
  // display table before mounting vue
  beforeMount () {
    this.allRecords()
  }
}
</script>

<style>

</style>
