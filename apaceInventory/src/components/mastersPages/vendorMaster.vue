// vendor master table
// folder: mastersPage

<template>
    <div>
        <div id="vendMastTable">
            <b-table class="small small" striped hover :items="items" @row-clicked="rowClicked"></b-table>
        </div>
    </div>
</template>

<script>
export default {
  name: 'vendorMaster',
  data () {
    return {
      compTitle: 'Vendor Master',
      items: []
    }
  },
  methods: {
    // display vendor master table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'vendor master'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after row of table is clicked
    rowClicked: function () {}
  },
  // display table before vue is mounted
  beforeMount () {
    this.allRecords()
  }
}
</script>

<style>

</style>
