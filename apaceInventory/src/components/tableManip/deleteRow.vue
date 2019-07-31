// component to delete row from table
// inputs: table name, serial number in the table

<template>
  <div id="deleteButton">
    <b-button size="sm" @click="deleteClicked(rowProp)" class="mr-2" variant="danger">-</b-button>

    <!-- modal to confirm deletion -->
    <b-modal centered title="Confirm" v-model="modalShow" size='sm' header-bg-variant='danger' header-text-variant='light'>
      <div><p>Do you really want to delete the row?</p></div>
      <div slot="modal-footer" class="w-100">
        <!-- cancel -->
        <b-button variant="primary" size="sm" class="float-left" @click="modalShow=!modalShow">
          Cancel
        </b-button>

        <!-- delete -->
        <b-button variant="danger" size='sm' class="float-right" @click="modalShow=!modalShow; deleteRow(rowProp)">Delete</b-button>
      </div>
    </b-modal>
    <!-- {{modalShow}} -->
  </div>
</template>

<script>
export default {
  props: ['rowProp', 'tableNameProp'],
  data () {
    return {
      modalShow: false
    }
  },
  methods: {
    // after delete button clicked
    deleteClicked: function (rowProp) { // delete clicked - show modal - check if you want to delete in the modal
      this.modalShow = true
    },
    deleteRow (rowProp) { // delete row if delete in modal clicked
      this.axios.get('http://' + this.$hostname + '/api/deleteDetails.php', {
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
