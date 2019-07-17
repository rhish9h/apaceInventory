// component to delete row from table
// inputs: table name, serial number in the table

<template>
  <div id="deleteButton">
    <b-button size="sm" @click="deleteClicked(rowProp)" class="mr-2" variant="danger">Delete</b-button>
  </div>
</template>

<script>
export default {
  props: ['rowProp', 'tableNameProp'],
  methods: {
    // after delete button clicked
    deleteClicked: function (rowProp) {
      this.axios
        .get('http://' + this.$hostname + '/api/deleteDetails.php', {
          params: {
            srno: rowProp.item['serial number'],
            tbNam: this.tableNameProp
          }
        })
        .then(response => {
          this.$emit('reloadTable')
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  }
}
</script>

<style>
</style>
