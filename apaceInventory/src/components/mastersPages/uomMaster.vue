<template>
    <div>
        <div id="uomMastTable">
            <b-table class="small small" striped hover :items="items"></b-table>
        </div>
    </div>
</template>

<script>
export default {
  name: 'uomMaster',
  data () {
    return {
      compTitle: 'Uom Master',
      items: []
    }
  },
  methods: {
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'uom master'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  beforeMount () {
    this.allRecords()
  }
}
</script>

<style>

</style>
