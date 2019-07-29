<template>
  <div>
    <b-row>
      <!-- filter (search) -->
      <b-col md="6" class="mt-2 ml-2">
        <b-form-group label-cols-sm="1" label="Filter" class="mb-0">
          <b-input-group>
            <b-form-input v-model="filter" placeholder="Type to Search" size='sm'></b-form-input>
            <b-input-group-append>
              <b-button :disabled="!filter" @click="filter = ''" size='sm'>Clear</b-button>
            </b-input-group-append>
          </b-input-group>
        </b-form-group>
      </b-col>

      <b-col class="mt-2">
        <!-- pagination for the table -->
        <b-pagination
          v-model="currentPage"
          :total-rows="totalRows"
          :per-page="perPage"
          aria-controls="rawMatStockTable"
          class="ml-2"
          size='sm'
        ></b-pagination>
      </b-col>
    </b-row>

    <!-- table display of rawMatStockTable -->
    <b-table id="rawMatStockTable" :per-page="perPage" :current-page="currentPage" class="small" striped hover
         :items="items" :fields="fields" :small=true :filter='filter' @filtered='onFiltered'
         sort-by="serial number" :sort-desc='true'>
    </b-table>
  </div>
</template>

<script>
export default {
  name: 'rawMaterialStock',
  data () {
    return {
      perPage: 15,
      currentPage: 1,
      items: [],
      fields: [
        {key: 'serial number', sortable: true},
        {key: 'material id', sortable: true},
        {key: 'stock', sortable: true},
        {key: 'purchase price', sortable: true},
        {key: 'stock value', sortable: true},
        {key: 'active', sortable: true}
      ],
      totalRows: 1,
      filter: ''
    }
  },
  methods: {
    // to display table
    allRecords: function () {
      this.axios.get('http://' + this.$hostname + '/api/displayTable.php', {
        params: {
          tableName: 'raw material stock' // send table name to be displayed
        }
      })
        .then((response) => {
          this.items = response.data
          // this.addShowDetails() // call to add show details property to every row
          this.totalRows = this.items.length // used for pagination
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    onFiltered (filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length
      this.currentPage = 1
    }
  },
  beforeMount () {
    this.allRecords()
  }
}
</script>

<style>

</style>
