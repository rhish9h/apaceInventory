<template>
    <div>
        <div id="matTypeMastTable">
            <b-table class="small small" striped hover :items="items"></b-table>
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
    }
  },
  beforeMount () {
    this.allRecords()
  }
}
</script>

<style>

</style>
