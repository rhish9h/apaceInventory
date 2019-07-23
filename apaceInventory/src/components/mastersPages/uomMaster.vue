// uom master table
// folder: mastersPages

<template>
    <div>
      <b-row>
        <b-col>
          <!-- add record into the table -->
          <div id="addRecordInUomMast">
            <!-- on add row - display table again -->
            <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="uom master"></add-row>
          </div>
        </b-col>
      </b-row>

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
            aria-controls="uomTable"
            class="ml-2"
            size='sm'
          ></b-pagination>
        </b-col>
      </b-row>
        <!-- display table -->
        <div id="uomMastTable">

            <b-table id="uomTable" :per-page="perPage" :current-page="currentPage" class="small small" striped hover
            :items="items" :fields="fields" @row-clicked="rowClicked" :small=true :filter='filter' @filtered='onFiltered'>

                <!-- buttons for delete and update -- slot-scope row used to access particular row-->
                <template slot="delete" slot-scope="row">
                    <!-- delete row component, send row and table name -->
                    <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="uom master"></delete-row>
                </template>

            <!-- collapse for updation of row -->
            <template slot="row-details" slot-scope="row">
              <b-card>
                <update-row :rowProp="row" tableNameProp="uom master" :updateFieldsProp="updateFields" @rowUpdated="allRecords"></update-row>
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
  name: 'uomMaster',
  data () {
    return {
      compTitle: 'Uom Master',
      fields: [
        {key: 'delete', sortable: false},
        {key: 'serial number', sortable: true},
        {key: 'uom', sortable: true},
        {key: 'active', sortable: true}
      ],
      items: [],
      inputs: {
        uom: ['', 'text'],
        active: [1, 'number']
      },
      updateFields: [['uom', 'text'], ['active', 'number']],
      perPage: 10,
      currentPage: 1,
      filter: null,
      totalRows: 1
    }
  },
  methods: {
    // to display table
    allRecords: function () {
      this.axios.get('http://' + this.$hostname + '/api/displayTable.php', {
        params: {
          tableName: 'uom master'
        }
      })
        .then((response) => {
          this.items = response.data
          this.addShowDetails() // call to add show details property to every row
          this.totalRows = this.items.length // for pagination
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after row click
    rowClicked: function (row) { // toggle _showDetails property on rowClick - later used for update
      row._showDetails = !row._showDetails
    },
    addShowDetails: function () { // add property _showDetails to every row of the table
      this.items.forEach(function (element) { element._showDetails = false })
    },
    onFiltered (filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length
      this.currentPage = 1
    }
  },
  beforeMount () { // display table before vue is mounted
    this.allRecords()
  },
  components: {
    'add-row': addRow, // register add row component
    'delete-row': delRow,
    'update-row': updRow
  },
  computed: {
  }
}
</script>

<style>

</style>
