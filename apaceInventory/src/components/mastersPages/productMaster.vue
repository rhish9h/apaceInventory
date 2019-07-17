// product master table
// folder: mastersPages

<template>
    <div>
      <!-- add record into the table -->
        <div id="addRecordInProdMast">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="product master"></add-row>
        </div>

      <!-- display table -->
        <div id="prodMastTable">

          <!-- pagination for the table -->
          <b-pagination
            v-model="currentPage"
            :total-rows="rows"
            :per-page="perPage"
            aria-controls="prodTable"
            class="ml-2"
          ></b-pagination>

            <b-table id="prodTable" :per-page="perPage" :current-page="currentPage" class="small small" striped hover :items="items" :fields="fields" @row-clicked="rowClicked" :small=true>

                <template slot="delete" slot-scope="row">
                  <!-- delete row component, send row and table name -->
                  <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="product master"></delete-row>
                </template>

                 <!-- collapse for updation of row -->
              <template slot="row-details" slot-scope="row">
                <b-card>
                  <update-row :rowProp="row" tableNameProp="product master" :updateFieldsProp="updateFields" @rowUpdated="allRecords"></update-row>
                </b-card>
              </template>

            </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'
import delRow from '../tableManip/deleteRow'
import updRow from '../tableManip/updateRow'

export default {
  name: 'productMaster',
  data () {
    return {
      compTitle: 'Product Master',
      fields: [
        {key: 'delete', sortable: false},
        {key: 'serial number', sortable: true},
        {key: 'product', sortable: true},
        {key: 'gender', sortable: true},
        {key: 'pattern', sortable: true},
        {key: 'active', sortable: true}
      ],
      inputs: {
        product: ['', 'text'],
        gender: ['', 'text'],
        pattern: ['', 'text'],
        active: [1, 'number']
      },
      items: [],
      updateFields: [
        ['product', 'text'],
        ['gender', 'text'],
        ['pattern', 'text'],
        ['active', 'number']
      ],
      perPage: 10,
      currentPage: 1
    }
  },
  methods: {
    // after row click
    rowClicked: function (row) { // toggle _showDetails property on rowClick - later used for update
      row._showDetails = !row._showDetails
    },
    addShowDetails: function () { // add property _showDetails to every row of the table
      this.items.forEach(function (element) { element._showDetails = false })
    },
    // display product master table
    allRecords: function () {
      this.axios.get('http://' + this.$hostname + '/api/displayTable.php', {
        params: {
          tableName: 'product master'
        }
      })
        .then((response) => {
          this.items = response.data
          this.addShowDetails()
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  // display table before mounting vue
  beforeMount () {
    this.allRecords()
  },
  // declare components
  components: {
    'add-row': addRow,
    'delete-row': delRow,
    'update-row': updRow
  },
  computed: {
    rows () { // get number of rows in the table used for pagination
      return this.items.length
    }
  }
}
</script>

<style>

</style>
