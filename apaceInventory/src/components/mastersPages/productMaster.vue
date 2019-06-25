<template>
    <div>
        <div id="prodMastTable">
            <b-table class="small small" striped hover :items="items"></b-table>
        </div>
    </div>
</template>

<script>
export default {
  name: 'productMaster',
  data () {
    return {
      compTitle: 'Product Master',
      items: []
    }
  },
  methods: {
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'product master'
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
